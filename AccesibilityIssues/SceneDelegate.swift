//
//  SceneDelegate.swift
//  AccesibilityIssues
//
//  Created by Facundo Aramayo on 06/08/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
            
        let homeViewController = HomeViewController()
        let homeTab = UITabBarItem(title: NSLocalizedString("home_tab", comment: ""), image: UIImage(systemName: "house.fill"), tag: 0)
        homeTab.setTitleTextAttributes([.font: UIFont.preferredFont(forTextStyle: .footnote)], for: .normal)
        homeTab.setTitleTextAttributes([.font: UIFont.preferredFont(forTextStyle: .footnote)], for: .selected)
        homeViewController.tabBarItem = homeTab
            
        let dashboardViewController = DashboardViewController()
        let dashboardTab = UITabBarItem(title: NSLocalizedString("dashboard_tab", comment: ""), image: UIImage(systemName: "chart.bar.fill"), tag: 1)
        dashboardTab.setTitleTextAttributes([.font: UIFont.preferredFont(forTextStyle: .footnote)], for: .normal)
        dashboardTab.setTitleTextAttributes([.font: UIFont.preferredFont(forTextStyle: .footnote)], for: .selected)
        dashboardViewController.tabBarItem = dashboardTab
        
        let notificationsViewController = NotificationsViewController()
        let notificationsTab = UITabBarItem(title: NSLocalizedString("notifications_tab", comment: ""), image: UIImage(systemName: "bell.fill"), tag: 2)
        notificationsTab.setTitleTextAttributes([.font: UIFont.preferredFont(forTextStyle: .footnote)], for: .normal)
        notificationsTab.setTitleTextAttributes([.font: UIFont.preferredFont(forTextStyle: .footnote)], for: .selected)
        notificationsViewController.tabBarItem = notificationsTab
            
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeViewController, dashboardViewController, notificationsViewController]
            
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

