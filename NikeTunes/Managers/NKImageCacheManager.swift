//
//  NKImageCacheManager.swift
//  NikeTunes
//
//  Created by Gabriel on 2/20/21.
//

import UIKit

protocol NKImageCacheManager_Protocol {
    func save(data: Data, forKey imageUrl: String)
    func retrieve(imageUrl: String, completion: @escaping (UIImage?) -> Void)
}

class NKImageCacheManager: NKImageCacheManager_Protocol {

    // MARK: - Variable
    private let cache = NSCache<NSString, NSData>()
    
    
    // MARK: - Save
    
    /**
    Saves data in cache.

    - Parameters:
        - data: data to be stored as value
        - imageUrl: image url to be stored as key
     
    - Returns: None.
    */
    
    func save(data: Data, forKey imageUrl: String) {
        cache.setObject(data as NSData, forKey: imageUrl as NSString)
    }


    // MARK: - Retrieve
    
    /**
    Fetches data from cache.

    - Parameters:
        - imageUrl: image url to be stored as key
        - completion: Completion handler to be fired after the operation
     
    - Returns: None.
    */
    
    func retrieve(imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        // Check image availability
        if let data = cache.object(forKey: imageUrl as NSString) as Data? {
            completion(UIImage(data: data))
            return
        }
        
        completion(nil)
        return
    }
}
