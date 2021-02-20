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
    
    // MARK: Table view Setup
    private let tableViewAlbums = UITableView()
    var albums: [NKAlbum] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpHomeView()
        tableViewAlbums.delegate = self
        tableViewAlbums.dataSource = self
    }

    func setUpHomeView() {
        view.addSubview(tableViewAlbums)
        tableViewAlbums.rowHeight = NKAlbumsViewControllerConstants.albumCellHeight
        tableViewAlbums.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableViewAlbums.frame = view.bounds
    }
 
}

extension NKAlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NKAlbumsViewControllerConstants.albumsTableViewIdentifier, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
}

extension NKAlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
