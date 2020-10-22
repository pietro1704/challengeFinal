//
//  ChapterCoordinator.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 22/10/20.
//

import UIKit

public class ChapterCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var storyNode: StoryNode
    var viewController: ChapterViewController?
    
    init (navigationController: UINavigationController, storyNode: StoryNode) {
        self.navigationController = navigationController
        self.storyNode = storyNode
    }
    
    func start() {
        viewController = ChapterViewController.instantiate(storyBoardName: "Chapter")
        let viewModel = ChapterViewModel(node: storyNode, coordinatorDelegate: self)
        viewController?.viewModel = viewModel
        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: false)
        }
    }

    func update(storyNode: StoryNode) {
        self.storyNode = storyNode
        let viewModel = ChapterViewModel(node: storyNode, coordinatorDelegate: self)
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

extension ChapterCoordinator: ChapterViewModelDelegate {
    public func userWantToStartChapter() {
        let coordinator = StoryCoordinator(navigationController: navigationController,
                                           storyNode: storyNode)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
