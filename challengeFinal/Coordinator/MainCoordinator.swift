//
//  MainCoordinator.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import Foundation
import UIKit

class MainCoordinator:Coordinator{
    var childCoordinators = [Coordinator]()
    
    var  navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController()
        navigationController.pushViewController(vc, animated: false)
    }
    
    
}
