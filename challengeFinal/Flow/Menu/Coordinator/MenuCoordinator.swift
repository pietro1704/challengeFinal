//
//  MainCoordinator.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import Foundation
import UIKit

class MenuCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MenuViewController.instantiate(storyBoardName: "Menu")
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
