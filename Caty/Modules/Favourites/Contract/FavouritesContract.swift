//
//  FavouritesContract.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

// MARK: - Router
enum FavouritesRouterAction {
}

protocol FavouritesRouterProtocol: class {
    func navigate(to route: FavouritesRouterAction)
}

// MARK: - Presenter
protocol FavouritesPresenterProtocol: class {
    var uiModel: FavouritesUIModel { get }
    
    func loadFavourites()
    func updatePictureFavouriteStatus(index: Int)
}

// MARK: - Interactor
protocol FavouritesInteractorProtocol: FavouritesCatPictureDatabaseServiceProtocol {
    func loadFavouritesCatsPictures() -> [CatPictureUIModel]
    func removeItemFromLocalFavourites(_ object: CatPictureUIModel, completion: (Result<Any, Error>) -> ())
}

// MARK: - View
protocol FavouritesViewProtocol: FavouritesCellProtocol {
    var presenter: FavouritesPresenterProtocol? { get set }
    
    func updateCollectionView()
    func removeCell(index: Int)
}

protocol FavouritesCellProtocol: class {
    func updateFavouriteStatus(for cell: FavouritesCatyCell)
}

