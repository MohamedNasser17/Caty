//
//  AppDelegate.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
    
    func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeRouter.createHomeModule()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}

