//
//  MainCoordinator.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import Foundation
import UIKit

class CreditsCoordinator: Coordinator {
    
    var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MenuViewController.instantiate(storyBoardName: "Credits")
        let playerService = PlayerService()
        let viewModel = MenuViewModel(coordinatorDelegate: self, playerService: playerService)
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
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

extension CreditsCoordinator: CreditsViewModelDelegate {
    func userWantToStartNewGame() {
        parentCoordinator?.userWantToStartNewGame(child: self)
    }
    
    func userWantToContinueGame(from node: StoryNode) {
        parentCoordinator?.userWantToContinue(from: node, child: self)
    }
}
