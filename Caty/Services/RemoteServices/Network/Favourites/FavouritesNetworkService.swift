//
//  FavouritesNetworkService.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

class FavouritesNetworkService: MoyaServiceHelper<FavouritesAPI>, FavouritesNetworkServiceProtocol {
    func addCatPictureToFavourites(pictureId: String, completion: @escaping (Result<Int, Error>) -> Void) {
        request(target: .addCatPictureToFavourites(pictureId: pictureId), completion: completion)
    }
    
    func fetchFavouritesCatsPictures(page: Int, limit: Int,
                                     completion: @escaping (Result<[FavouriteCatPicture], Error>) -> Void) {
        request(target: .fetchFavouritesCatsPictures(page: page, limit: limit), completion: completion)
    }
    
    func removeCatPictureFromFavourites(favouriteId: String,
                                        completion: @escaping (Result<String, Error>) -> Void) {
        request(target: .removeCatPictureFromFavourites(favouriteId: favouriteId), completion: completion)
    }
}
