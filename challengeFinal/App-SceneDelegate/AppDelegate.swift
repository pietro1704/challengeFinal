//
//  AppDelegate.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var coordinator: ChapterCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navController = UINavigationController()
        let services = StoryNodesServices()
        let firstNode = services.retrieveNode(nodeId: 1)
        let service = PlayerService()
        coordinator = ChapterCoordinator(navigationController: navController, storyNode: firstNode!, playerService: service)
        coordinator?.start()

        // Note: Refresh Player
        service.service.savePoints(0)
        service.service.saveStoryPath([])

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }

    /*
     save game e restore

     quick save, quick load

     diferença de slots de game -> quick mais rápido, nao seleciona


     */
}
