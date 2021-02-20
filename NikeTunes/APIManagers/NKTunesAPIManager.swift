//
//  NKTunesAPIManager.swift
//  NikeTunes
//
//  Created by Gabriel on 2/19/21.
//

import Foundation

enum NKAlbumError: Error {
    case NKAlbumErrorNone
    case NKAlbumErrorNoDataAvailable
    case NKAlbumErrorCannotDecodeData
}

protocol NKTunesAPIManager_Protocol {
    func getAlbums(completion: @escaping (Result<[NKAlbum], NKAlbumError>) -> Void)
}

class NKTunesAPIManager: NKTunesAPIManager_Protocol {
    func getAlbums(completion: @escaping (Result<[NKAlbum], NKAlbumError>) -> Void) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.NKAlbumErrorNoDataAvailable))
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let feedResponses = try decoder.decode(Main.self, from: data)
                let albumDetails = feedResponses.feed.results
                DispatchQueue.main.async {
                    completion(.success(albumDetails))
                }
                
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.NKAlbumErrorCannotDecodeData))
                }
            }
        }
        task.resume()
    }
}


