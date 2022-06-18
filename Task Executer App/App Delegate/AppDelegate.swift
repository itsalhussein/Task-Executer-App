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
        let viewController = HomeViewController()
        _ = AppNavigator(window: window ?? UIWindow(), viewController: viewController)
        
        
        return true
    }



}

