//
//  MainCoordinator.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 28/10/20.
//

import UIKit

public class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    let nodeService: StoryNodesServices = StoryNodesServices()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        //showMenu()
        
        showCredits()
        #warning("TROCAR PARA CREDITOS")
        
        // TODO: trocar para creditos
    }

    func showCredits() {
        let coordinator = CreditsCoordinator(navigationController: navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    func showMenu() {
        let coordinator = MenuCoordinator(navigationController: navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func showStory(with storyNode: StoryNode) {
        let coordinator = StoryCoordinator(navigationController: navigationController,
                                           storyNode: storyNode)
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func showChapter(with index: NodeID) {
        guard let node = nodeService.retrieveNode(nodeId: index) else { return }
        
        let coordinator = ChapterCoordinator(navigationController: navigationController,
                                                    storyNode: node)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    func userWantToStartNewGame(child: Coordinator) {
        self.childDidFinished(child)
        showChapter(with: 1)
    }
    
    func userWantToGoToMenu(child: Coordinator) {
        self.childDidFinished(child)
        showMenu()
    }

    func userWantToContinue(from node: StoryNode, child: Coordinator) {
        self.childDidFinished(child)
        showStory(with: node)
    }
    
    func childDidFinished(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}
