//
//  NKAlbumsViewController.swift
//  NikeTunes
//
//  Created by Gabriel on 2/18/21.
//

import UIKit

struct NKAlbumsViewControllerConstants {
    static let albumCellHeight: CGFloat = 200
    static let albumsTableViewIdentifier = "NKAlbumsTableViewId"
}

class NKAlbumsViewController: UIViewController {

    private var albumsViewModel : NKAlbumsViewModel
    private var alertPresenter: NKAlertPresenter_Protocol
    var spinnerView: ActivityIndicatorViewController?

    init(viewModel: NKAlbumsViewModel = NKAlbumsViewModel(), alertPresenter: NKAlertPresenter_Protocol = NKAlertPresenter()) {
        self.albumsViewModel = viewModel
        self.alertPresenter = alertPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.albumsViewModel = NKAlbumsViewModel()
        self.alertPresenter = NKAlertPresenter()
        super.init(coder: coder)
    }
    
    private let tableViewAlbums = UITableView()
    
    // MARK: View controllers life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpHomeView()
        initializeSpinner()
        tableViewAlbums.register(NKAlbumTableCell.self, forCellReuseIdentifier: NKAlbumsViewControllerConstants.albumsTableViewIdentifier)
        tableViewAlbums.delegate = self
        tableViewAlbums.dataSource = self
        loadAlbums()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableViewAlbums.frame = view.bounds
    }
    
    // MARK: Helper functions
    
    func setUpHomeView() {
        view.addSubview(tableViewAlbums)
        tableViewAlbums.rowHeight = NKAlbumsViewControllerConstants.albumCellHeight
        tableViewAlbums.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func loadAlbums() {
        spinnerView?.showActivityIndicatorView(on: self)
        albumsViewModel.fetchAlbums { [weak self] (albums, error) in
            self?.spinnerView?.removeActivityIndicatorView()
            
            if albums.count > 0 {
                self?.tableViewAlbums.reloadData()
            }
            
            if let nError = error {
                print("Error while fetching albums list : \(nError)")
                guard let self = self else { return }
                self.alertPresenter.present(from: self,
                                            title: "Error",
                                            message: "Error in Album API service.",
                                            dismissButtonTitle: "OK")
            }
        }
    }
    
    func initializeSpinner() {
        self.spinnerView = ActivityIndicatorViewController()
    }
}

// MARK: Table view data sources

extension NKAlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumsViewModel.albumsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NKAlbumsViewControllerConstants.albumsTableViewIdentifier, for: indexPath) as? NKAlbumTableCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

// MARK: Table view delegates

extension NKAlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
