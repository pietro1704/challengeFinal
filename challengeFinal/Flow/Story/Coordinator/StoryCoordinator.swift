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
        let viewModel = StoryViewModel(node: storyNode,
                                       coordinatorDelegate: self)
        viewController?.viewModel = viewModel
        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: false)
        }
    }

    func update(storyNode: StoryNode) {
        self.storyNode = storyNode
        let viewModel = StoryViewModel(node: storyNode,
                                       coordinatorDelegate: self)
        viewController?.update(with: viewModel)
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
