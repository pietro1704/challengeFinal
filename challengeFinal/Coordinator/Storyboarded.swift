//
//  Storyboarded.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(storyBoardName: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyBoardName: String) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyBoardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
