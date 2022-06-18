//
//  AppDelegate.swift
//  Task Executer App
//
//  Created by Hussein Anwar on 18/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)
        let newScreen = HomeViewController(with: HomeViewModel())
        let nav = UINavigationController(rootViewController: newScreen)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }



}

