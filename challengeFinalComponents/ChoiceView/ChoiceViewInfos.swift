//
//  ChoiceViewInfos.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import Foundation

public protocol ChoiceViewInfos {
    var dynamicButtons: [DynamicTypes] { get set }
    var nodes: [Node] { get set }
    var tintColor: String { get set }
}
