//
//  HomePresenter.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

class HomePresenter: HomePresenterProtocol {

    // MARK: - Attributes
    weak private var view: HomeViewProtocol?
    private var interactor: HomeInteractorProtocol?
    private let router: HomeRouterProtocol
    var uiModel: HomeUIModel

    // MARK: - init
    init(view: HomeViewProtocol,
         interactor: HomeInteractorProtocol?,
         router: HomeRouterProtocol,
         uiModel: HomeUIModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.uiModel = uiModel
    }
}

// MARK: - HomePresenterProtocol Methods
extension HomePresenter {
    func loadNextPage() {
        interactor?.loadCatsPictures(page: uiModel.page, limit: uiModel.limit, completion: { [weak self] result in
            switch result {
            case .success(let data):
                self?.uiModel.picturesDatasource = data
                self?.uiModel.page = (self?.uiModel.page ?? 0) + 1
                self?.view?.updateCollectionView()
            case.failure(let error):
                print("loadNextPage in HomePresenter has error: \(error)")
            }
        })
    }
    
    func refershCatPictures() {
        let updatedPictures = interactor?.refreshCatsPictures(catsPictures: uiModel.picturesDatasource)
        uiModel.picturesDatasource = updatedPictures ?? uiModel.picturesDatasource
        view?.updateCollectionView()
    }
    
    func loadFirstPage() {
        uiModel.page = 0
        loadNextPage()
    }
    
    func updatePictureFavouriteStatus(index: Int) {
        let isfavourite = uiModel.picturesDatasource[index].isFavourite
        if isfavourite {
            removePictureFromFavouties(index: index)
        } else {
            addPictureToFavouties(index: index)
        }
    }
    
    func favouritesAction() {
        router.navigate(to: .favouritesList)
    }
}

// MARK: - Helper Methods
extension HomePresenter {
    private func addPictureToFavouties(index: Int) {
        let picture = uiModel.picturesDatasource[index]
        interactor?.addItemToLocalFavourites(picture, completion: { [weak self] _ in
            self?.uiModel.picturesDatasource[index].isFavourite = true
            self?.view?.updateCell(index: index)
        })
    }
    
    private func removePictureFromFavouties(index: Int) {
        let picture = uiModel.picturesDatasource[index]
        interactor?.removeItemFromLocalFavourites(picture, completion: { [weak self] _ in
            self?.uiModel.picturesDatasource[index].isFavourite = false
            self?.view?.updateCell(index: index)
        })
    }
}
