//
//  AppDelegate.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let repo = Repository.create()
        let vc = ProfileVC(viewModel: ProfileVM(repository: repo))
        window?.rootViewController = UINavigationController(rootViewController: vc)
        
        
        window?.makeKeyAndVisible()
        return true
    }

}

