//
//  HomeRouter.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    
    // MARK: - Attributes
    weak var viewController: UIViewController?
    
    // MARK: - Assemple
    static func createHomeModule() -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let uiModel = HomeUIModel()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router, uiModel: uiModel)
        
        view.presenter = presenter
        router.viewController = view
        
        view.modalPresentationStyle = .overFullScreen
        
        return UINavigationController(rootViewController: view)
    }
    
    
    // MARK: - Routing
    func navigate(to route: HomeRouterAction) {
        switch route {
        case .favouritesList:
            let vc = FavouritesRouter.createFavouritesModule()
            viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
