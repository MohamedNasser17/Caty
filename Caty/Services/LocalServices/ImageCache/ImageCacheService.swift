//
//  ImageCacheService.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import SDWebImage

class ImageCacheService: ImageCacheServiceProtocol {
    
    // MARK: - Properties
    private var cache: SDImageCache!
    
    // MARK: - Init
    init(namespace: String) {
        cache = SDImageCache.init(namespace: namespace)
    }
    
    init() {
        cache = SDImageCache.shared
    }
}

// MARK: - ImageCacheServiceProtocol Methods
extension ImageCacheService {
    func removeImageFromCache(for key: String, completion: (() -> ())?) {
        cache.removeImage(forKey: key, withCompletion: completion)
    }
    func addImageToCache(image: UIImage?, for key: String, completion: (() -> ())?) {
        cache.store(image, forKey: key, completion: completion)
    }
}
