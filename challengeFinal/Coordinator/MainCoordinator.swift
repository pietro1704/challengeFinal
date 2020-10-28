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
        let startIndex: NodeID = 1
        showChapter(with: startIndex)
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
    
    func childDidFinished(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}
