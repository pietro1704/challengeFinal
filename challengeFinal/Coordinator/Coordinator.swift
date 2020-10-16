//
//  Coordinator.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import Foundation
import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func childDidFinished(_ child: Coordinator?)
}
