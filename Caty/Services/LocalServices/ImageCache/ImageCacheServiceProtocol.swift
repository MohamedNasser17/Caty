//
//  ImageCacheServiceProtocol.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import UIKit

protocol ImageCacheServiceProtocol {
    func removeImageFromCache(for key: String, completion: (() -> ())?)
    func addImageToCache(image: UIImage?, for key: String, completion: (() -> ())?)
}

extension ImageCacheServiceProtocol {
    func removeImageFromCache(for key: String, completion: (() -> ())?) {
        let service = ImageCacheService()
        service.removeImageFromCache(for: key, completion: completion)
    }
    func addImageToCache(image: UIImage?, for key: String, completion: (() -> ())?) {
        let service = ImageCacheService()
        service.addImageToCache(image: image, for: key, completion: completion)
    }
}
