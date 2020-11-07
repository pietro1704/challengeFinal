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
    
    init (navigationController: UINavigationController, storyNode: StoryNode) {
        self.navigationController = navigationController
        self.storyNode = storyNode
    }

    func start() {
        viewController = ChapterViewController.instantiate(storyBoardName: "Chapter")
        let playerService = PlayerService()
        let viewModel = ChapterViewModel(node: storyNode, coordinatorDelegate: self, playerService: playerService)
        viewController?.viewModel = viewModel
        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: false)
        }
    }

    func update(storyNode: StoryNode) {
        self.storyNode = storyNode
        let playerService = PlayerService()
        let viewModel = ChapterViewModel(node: storyNode, coordinatorDelegate: self, playerService: playerService)
        viewController?.update(with: viewModel)
    }

    func showStory(with node: StoryNode) {
        let coordinator = StoryCoordinator(navigationController: navigationController,
                                           storyNode: node)
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }

    func showCredits(child: StoryCoordinator) {
        childDidFinished(child)
        // TODO: Pietro and Guizao: confiram por favor se desta forma qnd instanciar novamente o chapter ele não vai empilhar
        // TODO: Pietro: substituir o start abaixo pelo start do seu coordinator
//        let coordinator = Credits coordinator..
        start()
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
