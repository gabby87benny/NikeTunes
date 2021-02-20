//
//  NKAlbumsViewModel.swift
//  NikeTunes
//
//  Created by Gabriel on 2/19/21.
//

import Foundation

class NKAlbumsViewModel {
    private var albums = [NKAlbum]()
    private let mobileService: NKTunesAPIManager_Protocol
    typealias CompletionResult = ([NKAlbum], Error?) -> ()
    
    init(albums: [NKAlbum] = [], mobileService: NKTunesAPIManager_Protocol = NKTunesAPIManager()) {
        self.albums = albums
        self.mobileService = mobileService
    }
    
    func fetchAlbums(completion: @escaping CompletionResult) {
        self.mobileService.getAlbums {[weak self] result in
            switch result {
                case .failure(let error):
                    print(error)
                    completion([], error)
                case .success(let albums):
                    self?.albums.append(contentsOf: albums)
                    completion(albums, nil)
            }
        }
    }
    
    /**
    Returns count of albums.
     
    - Returns: Number of rows.
    */
    
    func albumsCount() -> Int {
        return self.albums.count
    }

    /**
    Returns album info at indexpath.

    - Parameters:
       - indexPath: The indexpath to look for
     
    - Returns: The corresponding album info at indexpath.
    */
    
    func album(at indexPath: IndexPath) -> NKAlbum? {
        guard indexPath.row < albums.count  else { return nil }
        return albums[indexPath.row]
    }
}

