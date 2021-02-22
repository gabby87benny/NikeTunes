//
//  NKTunesAPIManager.swift
//  NikeTunes
//
//  Created by Gabriel on 2/19/21.
//

import Foundation

struct NKTunesAPIManagerConstants {
    static let albumUrl = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
}

enum NKAlbumError: Error {
    case NKAlbumErrorNone
    case NKAlbumErrorNoDataAvailable
    case NKAlbumErrorCannotDecodeData
}

protocol NKTunesAPIManager_Protocol {
    func getAlbums(completion: @escaping (Result<[NKAlbum], NKAlbumError>) -> Void)
}

class NKTunesAPIManager: NKTunesAPIManager_Protocol {
    
    /**
    Get albums from Apple Tunes API.

    - Parameters:
       - completion: The completion handler to be fired after the data operations are over
     
    - Returns: None.
    */
    
    func getAlbums(completion: @escaping (Result<[NKAlbum], NKAlbumError>) -> Void) {
        guard let url = URL(string: NKTunesAPIManagerConstants.albumUrl) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil, self.isValidResponse(optionalResponse: response), let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.NKAlbumErrorNoDataAvailable))
                }
                return
            }
            
            if let nkAlbums = self.parseData(data) {
                DispatchQueue.main.async {
                    completion(.success(nkAlbums))
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(.failure(.NKAlbumErrorCannotDecodeData))
                }
            }
        }
        task.resume()
    }
    
    /**
    Parses the data from Albums API.

    - Parameters:
       - data: The data to be parsed
     
    - Returns: The albums received from API.
    */
    
    private func parseData (_ data: Data) -> [NKAlbum]? {
        do {
            let feedResponses = try JSONDecoder().decode(Main.self, from: data)
            let albumDetails = feedResponses.feed.results
            return albumDetails
            
        } catch {
            print("parsing error: \(error)")
            return nil
        }
    }
    
    /**
    Returns if the response from API is valid or not.

    - Parameters:
       - optionalResponse: The response to validate
     
    - Returns: The response is valid or not.
    */
    
    private func isValidResponse(optionalResponse: URLResponse?) -> Bool {
        guard let response = optionalResponse as? HTTPURLResponse, response.statusCode == 200 else { return false }
        return true
    }
}


