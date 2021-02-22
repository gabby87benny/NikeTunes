//
//  NKAlbumsImageView.swift
//  NikeTunes
//
//  Created by Gabriel on 2/19/21.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class NKAlbumsImageView: UIImageView {

    var task: URLSessionDataTask?
    private let cacheManager: NKImageCacheManager_Protocol = NKImageCacheManager()
    
    /**
    Downloads the image from server and loads in image using Cache operations

    - Parameters:
        - url: url to download the image
     
    - Returns: None.
    */
    
    func loadImage(from url: URL) {
        image = nil
        task?.cancel()
        
        self.cacheManager.retrieve(imageUrl: url.absoluteString) { [weak self] cachedImage in
            self?.image = cachedImage
            return
        }
        
        task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard
                let theData = data,
                let newImage = UIImage(data: theData)
            else {
                print("Couldn't load image from url: \(url)")
                return
            }
            
            self.cacheManager.save(data: theData, forKey: url.absoluteString)
            
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
            
        task?.resume()
    }
}
