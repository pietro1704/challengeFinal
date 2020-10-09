//
//  Coordinator.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import Foundation
import UIKit

protocol Coordinator {
    var children:[Coordinator]{get set}
    var nav:UINavigationController{get set}
    
    func start()
}
