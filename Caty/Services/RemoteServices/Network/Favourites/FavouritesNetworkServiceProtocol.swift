//
//  FavouritesNetworkServiceProtocol.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

protocol FavouritesNetworkServiceProtocol {
    func addCatPictureToFavourites(pictureId: String, completion: @escaping (Result<Int, Error>) -> Void)
    func fetchFavouritesCatsPictures(page: Int, limit: Int, completion: @escaping (Result<[FavouriteCatPicture], Error>) -> Void)
    func removeCatPictureFromFavourites(favouriteId: String, completion: @escaping (Result<String, Error>) -> Void)
}

extension FavouritesNetworkServiceProtocol {
    func addCatPictureToFavourites(pictureId: String, completion: @escaping (Result<Int, Error>) -> Void) {
        let service = FavouritesNetworkService()
        service.addCatPictureToFavourites(pictureId: pictureId, completion: completion)
    }
    
    func fetchFavouritesCatsPictures(page: Int, limit: Int,
                                     completion: @escaping (Result<[FavouriteCatPicture], Error>) -> Void) {
        let service = FavouritesNetworkService()
        service.fetchFavouritesCatsPictures(page: page, limit: limit, completion: completion)
    }
    
    func removeCatPictureFromFavourites(favouriteId: String,
                                        completion: @escaping (Result<String, Error>) -> Void) {
        let service = FavouritesNetworkService()
        service.removeCatPictureFromFavourites(favouriteId: favouriteId, completion: completion)
    }
}
