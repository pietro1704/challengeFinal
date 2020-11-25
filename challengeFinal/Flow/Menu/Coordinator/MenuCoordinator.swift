//
//  MainCoordinator.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import Foundation
import UIKit

class MenuCoordinator: Coordinator {
    
    var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let eventLogger: LogEventProtocol

    init(navigationController: UINavigationController, eventLogger: LogEventProtocol) {
        self.navigationController = navigationController
        self.eventLogger = eventLogger
    }

    func start() {
        let vc = MenuViewController.instantiate(storyBoardName: "Menu")
        let playerService = PlayerService()
        let viewModel = MenuViewModel(coordinatorDelegate: self, playerService: playerService,
                                      eventLogger: eventLogger)
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

extension MenuCoordinator: MenuViewModelDelegate {
    func userWantToStartNewGame() {
        parentCoordinator?.userWantToStartNewGame(child: self)
    }
    
    func userWantToContinueGame(from node: StoryNode) {
        parentCoordinator?.userWantToContinue(from: node, child: self)
    }
}
