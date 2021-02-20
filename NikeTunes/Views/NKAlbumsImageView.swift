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
    
    func loadImage(from url: URL) {
        
        image = nil
        
        if let task = task {
            task.cancel()
        }
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            image = cachedImage
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
            
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        if let task = task {
            task.resume()
        }
    }
}
