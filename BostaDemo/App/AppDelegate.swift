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
        
        let vc = ProfileVC(viewModel: ProfileVM())
        window?.rootViewController = UINavigationController(rootViewController: vc)
        
        
        window?.makeKeyAndVisible()
        return true
    }

}

