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
    let eventLogger: LogEventProtocol

    init(navigationController: UINavigationController,
         eventLogger: LogEventProtocol) {
        self.navigationController = navigationController
        self.eventLogger = eventLogger
    }

    func start() {
        let vc = CreditsViewController.instantiate(storyBoardName: "Credits")
        let playerService = PlayerService()
        let viewModel = CreditsViewModel(coordinatorDelegate: self, playerService: playerService,
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

extension CreditsCoordinator: CreditsViewModelDelegate {
    func userWantToGoToMenu() {
        parentCoordinator?.userWantToGoToMenu(child: self)
    }

    func userWantToStartNewGame() {
        parentCoordinator?.userWantToStartNewGame(child: self)
    }
}
