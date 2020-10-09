//
//  MainCoordinator.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import Foundation
import UIKit

class MainCoordinator:Coordinator{
    func start() {
        let vc = ViewController()
        vc.coordinator = self
        nav.pushViewController(vc, animated:false)
    }
    
    
}
