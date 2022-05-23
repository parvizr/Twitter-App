//
//  CustomTabBarController.swift
//  twitterApp
//
//  Created by javad on 01.04.22.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let homeController = UserController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: homeController)
        navigationController.tabBarItem.title = "Home"
        navigationController.tabBarItem.image = #imageLiteral(resourceName: "compose")
        
        let notificationViewController = NotificationViewController()
        notificationViewController.navigationItem.title = "Notification"
        let notificationNavigationController = UINavigationController(rootViewController: notificationViewController)
        notificationNavigationController.title = "Notification"
        notificationNavigationController.tabBarItem.image = #imageLiteral(resourceName: "title_icon")
        
        let messageViewController = UIViewController()
        messageViewController.navigationItem.title = "Message"
        messageViewController.view.backgroundColor = .systemPink
        let messageNavigationcontroler = UINavigationController(rootViewController: messageViewController)
        messageNavigationcontroler.title = "Message"
        messageNavigationcontroler.tabBarItem.image = #imageLiteral(resourceName: "send_message")
        
        let meViewController = UIViewController()
        meViewController.navigationItem.title = "Me"
        meViewController.view.backgroundColor = .systemOrange
        let meNavigationController = UINavigationController(rootViewController: meViewController)
        meNavigationController.title = "Me"
        meNavigationController.tabBarItem.image = #imageLiteral(resourceName: "follow-1")
        
        tabBar.isTranslucent = false
        
        viewControllers = [navigationController, notificationNavigationController, messageNavigationcontroler, meNavigationController]
        
    }
}
