//
//  FavouritesPresenter.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

class FavouritesPresenter: FavouritesPresenterProtocol {

    // MARK: - Attributes
    weak private var view: FavouritesViewProtocol?
    private var interactor: FavouritesInteractorProtocol?
    private let router: FavouritesRouterProtocol
    var uiModel: FavouritesUIModel

    // MARK: - init
    init(view: FavouritesViewProtocol,
         interactor: FavouritesInteractorProtocol?,
         router: FavouritesRouterProtocol,
         uiModel: FavouritesUIModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.uiModel = uiModel
    }
}

// MARK: - FavouritesPresenterProtocol Methods
extension FavouritesPresenter {
    func loadFavourites() {
        let items = interactor?.loadFavouritesCatsPictures() ?? []
        uiModel.picturesDatasource = items
        view?.updateCollectionView()
    }
    
    func updatePictureFavouriteStatus(index: Int) {
        removePictureFromFavouties(index: index)
    }
}

// MARK: - Helper Methods
extension FavouritesPresenter {
    private func removePictureFromFavouties(index: Int) {
        let picture = uiModel.picturesDatasource[index]
        interactor?.removeItemFromLocalFavourites(picture, completion: { [weak self] _ in
            self?.uiModel.picturesDatasource.remove(at: index)
            self?.view?.removeCell(index: index)
        })
    }
}
