//
//  StoryCoordinator.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public class StoryCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var storyNode: StoryNode
    var viewController: StoryViewController?

    init (navigationController: UINavigationController, storyNode: StoryNode) {
        self.navigationController = navigationController
        self.storyNode = storyNode
    }
    
    func start() {
        viewController = StoryViewController.instantiate(storyBoardName: "Story")
        let playerService = PlayerService()
        let viewModel = StoryViewModel(node: storyNode,
                                       coordinatorDelegate: self,
                                       playerService: playerService)
        viewController?.viewModel = viewModel
        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: false)
        }
    }

    func update(storyNode: StoryNode) {
        self.storyNode = storyNode
        let playerService = PlayerService()
        let viewModel = StoryViewModel(node: storyNode,
                                       coordinatorDelegate: self,
                                       playerService: playerService)
        viewController?.update(with: viewModel)
    }

    func showChoices(with childNodes: [StoryNode]) {
        let coordinator = ChoiceCoordinator(navigationController: navigationController,
                                            infos: ChoiceViewInfosObject(nodes: childNodes,
                                                                         selectedDynamic: .choice,
                                                                         selectedNode: nil,
                                                                         highlightedNode: nil))
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func userWantToDismissChoices(_ coordinator: ChoiceCoordinator) {
        childDidFinished(coordinator)
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

extension StoryCoordinator: StoryViewModelDelegate {
    public func userChoosedNode(_ node: StoryNode) {
        self.update(storyNode: node)
    }
}
