//
//  FavouritesInteractor.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

class FavouritesInteractor: FavouritesInteractorProtocol {
    func loadFavouritesCatsPictures() -> [CatPictureUIModel] {
        let items = getFavouritesItems().map { picture -> CatPictureUIModel in
            return CatPictureUIModel(id: picture.id, url: picture.url, isFavourite: true)
        }
        return items
    }
    
    
    func addItemToLocalFavourites(_ object: CatPictureUIModel, completion: (Result<Any, Error>) -> ()) {
        let item = CatPicture(id: object.id, url: object.url)
        addItemToLocalFavourites(item) { result in
            completion(result)
        }
    }
    
    func removeItemFromLocalFavourites(_ object: CatPictureUIModel, completion: (Result<Any, Error>) -> ()) {
        let item = CatPicture(id: object.id, url: object.url)
        removeItemFromLocalFavourites(item) { result in
            completion(result)
        }
    }
}

// MARK: - Helper Methods
extension FavouritesInteractor {
    private func convertToCatPictureUIModel(_ catPicture: CatPicture) -> CatPictureUIModel {
        let isFavourite = checkItemInLocalFavourites(id: catPicture.id)
        let catUIModel = CatPictureUIModel(id: catPicture.id, url: catPicture.url, isFavourite: isFavourite)
        return catUIModel
    }
}
