//
//  HomeInteractor.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
    func loadCatsPictures(page: Int, limit: Int, completion: @escaping (Result<[CatPictureUIModel], Error>) -> Void) {
        fetchCatsPictures(page: page, limit: limit) { result in
            switch result {
            case .success(let data):
                let uiData = data.map({ [weak self] catPicture in
                    return self?.convertToCatPictureUIModel(catPicture) ?? CatPictureUIModel()
                })
                completion(.success(uiData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
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
    
    func refreshCatsPictures(catsPictures: [CatPictureUIModel]) -> [CatPictureUIModel] {
        var updatedPictures = catsPictures
        for i in 0..<updatedPictures.count {
            updatedPictures[i].isFavourite = checkItemInLocalFavourites(id: updatedPictures[i].id)
        }
        return updatedPictures
    }
}

// MARK: - Helper Methods
extension HomeInteractor {
    private func convertToCatPictureUIModel(_ catPicture: CatPicture) -> CatPictureUIModel {
        let isFavourite = checkItemInLocalFavourites(id: catPicture.id)
        let catUIModel = CatPictureUIModel(id: catPicture.id, url: catPicture.url, isFavourite: isFavourite)
        return catUIModel
    }
}
