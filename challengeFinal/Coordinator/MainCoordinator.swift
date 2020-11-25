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
    let logger: LogEventProtocol

    init(navigationController: UINavigationController, logger: LogEventProtocol? = nil) {
        self.navigationController = navigationController
        
        if let logger = logger {
            self.logger = logger
        } else {
            self.logger = AnalyticsLogger()
        }
    }

    func start() {
        showMenu()
    }

    func showCredits() {
        let coordinator = CreditsCoordinator(navigationController: navigationController,
                                             eventLogger: logger)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func showMenu() {
        let coordinator = MenuCoordinator(navigationController: navigationController,
                                          eventLogger: logger)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func showStory(with storyNode: StoryNode) {
        let coordinator = StoryCoordinator(navigationController: navigationController,
                                           storyNode: storyNode,
                                           eventLogger: logger)
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
                                             storyNode: node,
                                             eventLogger: logger)
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
