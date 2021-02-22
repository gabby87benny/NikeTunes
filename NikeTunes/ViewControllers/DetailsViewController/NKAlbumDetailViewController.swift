//
//  NKAlbumDetailViewController.swift
//  NikeTunes
//
//  Created by Gabriel on 2/19/21.
//

import UIKit

struct NKAlbumDetailViewControllerConstants {
    static let iTunesButtonText = "View in iTunes"
}

class NKAlbumDetailViewController: UIViewController {
    var album: NKAlbum?
    
    let albumImage = NKAlbumsImageView(),
    artistLabel = UILabel(),
    albumLabel = UILabel(),
    genreLabel = UILabel(),
    releaseDate = UILabel(),
    copyrightInfo = UILabel(),
    iTunesButton = UIButton(),
    backButton = UIButton(),
    contentScrollView = UIScrollView()

    // MARK: View controllers life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = album?.name
        view.backgroundColor = .white
        view.addSubviews(albumImage, artistLabel, albumLabel, genreLabel, releaseDate, copyrightInfo, backButton, iTunesButton)
        configureDetailView()
    }
    
    // MARK: Helper functions
    
    func configureDetailView() {
        
        func configureLabels(labels: UILabel...) {
            for label in labels {
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = 0
                label.lineBreakMode = .byWordWrapping
                label.adjustsFontSizeToFitWidth = true
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                label.textAlignment = .center
            }
        }
        
        func setupImage() {
            albumImage.translatesAutoresizingMaskIntoConstraints = false
            albumImage.contentMode = .scaleAspectFit
            albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            albumImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
            albumImage.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5).isActive = true
            albumImage.heightAnchor.constraint(equalToConstant: view.frame.width / 1.5).isActive = true
        }
        
        func setupiTunesButton() {
            iTunesButton.translatesAutoresizingMaskIntoConstraints = false
            iTunesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            iTunesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            iTunesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
            iTunesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            iTunesButton.setTitle(NKAlbumDetailViewControllerConstants.iTunesButtonText, for: .normal)
            iTunesButton.setTitleColor(.white, for: .normal)
            iTunesButton.backgroundColor = .darkGray
            iTunesButton.addTarget(self, action: #selector(openiTunes), for: .touchUpInside)
        }

        func setupArtistLabel() {
            artistLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 30).isActive = true
        }
        
        func setupAlbumLabel() {
            albumLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 15).isActive = true
        }
        
        func setupGenreLabel() {
            genreLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 15).isActive = true
        }
        
        func setupDateLabel() {
            releaseDate.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 15).isActive = true
        }
        
        func setupCopyLabel() {
            copyrightInfo.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 15).isActive = true
        }
        
        func loadAlbumContent() {
            if let albumInfo = album, let url = URL(string: albumInfo.artworkUrl100)
            {
                albumImage.loadImage(from: url)
                artistLabel.text = albumInfo.artistName
                albumLabel.text = albumInfo.name
                genreLabel.text = albumInfo.genres[0].name
                releaseDate.text = albumInfo.releaseDate
                copyrightInfo.text = albumInfo.copyright
            }
        }
        
        setupImage()
        loadAlbumContent()
        setupArtistLabel()
        setupAlbumLabel()
        setupGenreLabel()
        setupDateLabel()
        setupCopyLabel()
        setupiTunesButton()
        configureLabels(labels: artistLabel, albumLabel, genreLabel, releaseDate, copyrightInfo)
    }

    // MARK: Action handlers
    
    @objc func openiTunes() {
        guard let urlStr = self.album?.url, let url = URL(string: urlStr), UIApplication.shared.canOpenURL(url) else {
            print("Issue in connecting to iTunes.")
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
