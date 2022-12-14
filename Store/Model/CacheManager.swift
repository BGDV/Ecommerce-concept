//
//  CacheManager.swift
//  Store
//
//  Created by BGDV on 13.12.2022.
//

import Foundation
import UIKit

class CacheManager {
    
    static let instance = CacheManager()
    
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
    }
    
    func getFromCache(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
    
}
