//
//  AppDelegate.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var coordinator: ChoiceCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navController = UINavigationController()
        let services = StoryNodesServices()
        let firstNode = services.retrieveNode(nodeId: 1)
        coordinator = ChoiceCoordinator(navigationController: navController,
                                        infos: ChoiceViewInfosObject(nodes: firstNode!.childNodes))
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}

