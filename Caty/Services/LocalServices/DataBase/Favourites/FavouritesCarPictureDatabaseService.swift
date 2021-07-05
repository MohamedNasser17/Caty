//
//  FavouritesCarPictureDatabaseService.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import RealmSwift

class FavouritesCarPictureDatabaseService: BaseDatabaseService, FavouritesCatPictureDatabaseServiceProtocol {
    func getFavouritesItems() -> [CatPicture] {
        let items = getItemsFromLocalDataBase(type: CatPictureEntity.self).map({ $0 as CatPicture })
        return items
    }
    
    func addItemToLocalFavourites(_ object: CatPicture, completion: (Result<Any, Error>) -> ()) {
        return addItemToLocalDataBase(object: object.toEntity, completion: completion)
    }
    
    func removeItemFromLocalFavourites(_ object: CatPicture, completion: (Result<Any, Error>) -> ()) {
        let query = "id = \'\(object.id)\'"
        return removeItemFromLocalDataBase(type: CatPictureEntity.self, query: query, completion: completion)
    }
    
    func checkItemInLocalFavourites(id: String) -> Bool {
        let query = "id = \'\(id)\'"
        let item = getItemsFromLocalDataBase(type: CatPictureEntity.self, query: query)
            .map({ $0 as CatPicture })
            .first
        let isFavourite = item != nil
        return isFavourite
    }
}
