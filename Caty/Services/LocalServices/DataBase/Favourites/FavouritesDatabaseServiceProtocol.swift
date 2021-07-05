//
//  FavouritesDatabaseServiceProtocol.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

protocol FavouritesCatPictureDatabaseServiceProtocol {
    func getFavouritesItems() -> [CatPicture]
    func addItemToLocalFavourites(_ object: CatPicture, completion: @escaping (Result<Any, Error>) -> ())
    func removeItemFromLocalFavourites(_ object: CatPicture, completion: @escaping (Result<Any, Error>) -> ())
    func checkItemInLocalFavourites(id: String) -> Bool
}

extension FavouritesCatPictureDatabaseServiceProtocol {
    func getFavouritesItems() -> [CatPicture]  {
        let service = FavouritesCarPictureDatabaseService()
        return service.getFavouritesItems()
    }
    
    func addItemToLocalFavourites(_ object: CatPicture, completion: (Result<Any, Error>) -> ()) {
        let service = FavouritesCarPictureDatabaseService()
        return service.addItemToLocalFavourites(object, completion: completion)
    }
    
    func removeItemFromLocalFavourites(_ object: CatPicture, completion: (Result<Any, Error>) -> ()) {
        let service = FavouritesCarPictureDatabaseService()
        return service.removeItemFromLocalFavourites(object, completion: completion)
    }
    
    func checkItemInLocalFavourites(id: String) -> Bool {
        let service = FavouritesCarPictureDatabaseService()
        return service.checkItemInLocalFavourites(id: id)
    }
}
