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
    let playerService: PlayerServiceProtocol = PlayerService()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showMenu()
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
    
    func showOnboarding() {
        let coordinator = OnboardingCoordinator(navigationController: navigationController)
        coordinator.parentCoordinator = self
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
        
        if playerService.didSeeOnboarding() {
            showChapter(with: 1)
        } else {
            showOnboarding()
        }
    }
    
    func userWantToStartChapter(child: Coordinator) {
        self.childDidFinished(child)
        
        //Removing onboarding view controller from navigation
        if let topViewController = navigationController.topViewController,
           topViewController.isKind(of: OnboardingViewController.self) {
            navigationController.popViewController(animated: false)
        }
        
        showChapter(with: 1)
    }
    
    func userWantToGoToMenu(child: Coordinator) {
        self.childDidFinished(child)
        showMenu()
    }
    
    func userWantToShowCredits(child: Coordinator) {
        playerService.cleanAllNodes()

        self.childDidFinished(child)
        showCredits()
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
