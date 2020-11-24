//
//  ChapterCoordinator.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 22/10/20.
//

import UIKit

public class ChapterCoordinator: Coordinator {
    
    var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var storyNode: StoryNode
    var viewController: ChapterViewController?
    let eventLogger: LogEventProtocol

    init (navigationController: UINavigationController, storyNode: StoryNode,
          eventLogger: LogEventProtocol) {
        self.navigationController = navigationController
        self.storyNode = storyNode
        self.eventLogger = eventLogger
    }

    func start() {
        viewController = ChapterViewController.instantiate(storyBoardName: "Chapter")
        let playerService = PlayerService()
        let viewModel = ChapterViewModel(node: storyNode, coordinatorDelegate: self,
                                         playerService: playerService, eventLogger: eventLogger)
        viewController?.viewModel = viewModel
        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: false)
        }
    }

    func update(storyNode: StoryNode) {
        self.storyNode = storyNode
        let playerService = PlayerService()
        let viewModel = ChapterViewModel(node: storyNode, coordinatorDelegate: self,
                                         playerService: playerService, eventLogger: eventLogger)
        viewController?.update(with: viewModel)
    }

    func showStory(with node: StoryNode) {
        let coordinator = StoryCoordinator(navigationController: navigationController,
                                           storyNode: node, eventLogger: eventLogger)
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }

    func showCredits(child: StoryCoordinator) {
        childDidFinished(child)
        
        parentCoordinator?.userWantToShowCredits(child: self)
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
    public func userWantToShowStory() {
        showStory(with: storyNode)
    }
}
