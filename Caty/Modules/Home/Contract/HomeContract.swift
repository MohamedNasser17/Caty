//
//  HomeContract.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

// MARK: - Router
enum HomeRouterAction {
    case favouritesList
}

protocol HomeRouterProtocol: class {
    func navigate(to route: HomeRouterAction)
}

// MARK: - Presenter
protocol HomePresenterProtocol: class {
    var uiModel: HomeUIModel { get }
    
    func loadNextPage()
    func loadFirstPage()
    
    func favouritesAction()
    func refershCatPictures()
    func updatePictureFavouriteStatus(index: Int)
}

// MARK: - Interactor
protocol HomeInteractorProtocol: HomeNetworkServiceProtocol, FavouritesCatPictureDatabaseServiceProtocol {
    func refreshCatsPictures(catsPictures: [CatPictureUIModel]) -> [CatPictureUIModel]
    func addItemToLocalFavourites(_ object: CatPictureUIModel, completion: (Result<Any, Error>) -> ())
    func removeItemFromLocalFavourites(_ object: CatPictureUIModel, completion: (Result<Any, Error>) -> ())
    func loadCatsPictures(page: Int, limit: Int, completion: @escaping (Result<[CatPictureUIModel], Error>) -> Void)
}

// MARK: - View
protocol HomeViewProtocol: HomeCellProtocol {
    var presenter: HomePresenterProtocol? { get set }
    
    func updateCollectionView()
    func updateCell(index: Int)
}

protocol HomeCellProtocol: class {
    func updateFavouriteStatus(for cell: HomeCatyCell)
}

