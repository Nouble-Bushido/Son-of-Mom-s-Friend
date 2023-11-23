//
//  AppDelegate.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 26.10.2023.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        CelebrityManager.configure()
        AchievementManager.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let splashVC = SplashViewController.make()
            navigationController = UINavigationController(rootViewController: splashVC)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        
        return true
    }
}

