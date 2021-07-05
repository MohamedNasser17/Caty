//
//  FavouritesRouter.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import UIKit

class FavouritesRouter: FavouritesRouterProtocol {
    
    // MARK: - Attributes
    weak var viewController: UIViewController?
    
    // MARK: - Assemple
    static func createFavouritesModule() -> UIViewController {
        let view = FavouritesViewController()
        let interactor = FavouritesInteractor()
        let router = FavouritesRouter()
        let uiModel = FavouritesUIModel()
        let presenter = FavouritesPresenter(view: view, interactor: interactor, router: router, uiModel: uiModel)
        
        view.presenter = presenter
        router.viewController = view
        
        view.modalPresentationStyle = .overFullScreen
        
        return view
    }
    
    
    // MARK: - Routing
    func navigate(to route: FavouritesRouterAction) {
        switch route {
        }
    }

}
