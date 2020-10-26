//
//  ChoiceViewInfos.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import Foundation

public protocol ChoiceViewInfos {
    var dynamicButtons: [DynamicTypes] { get set }
    var nodes: [StoryNode] { get set }
    var tintColor: String { get set }
}

public struct ChoiceViewInfosObject: ChoiceViewInfos {
    public var dynamicButtons: [DynamicTypes]
    public var nodes: [StoryNode]
    public var tintColor: String
    
    init(nodes: [StoryNode]) {
        self.nodes = nodes
        self.tintColor = "Red"
        self.dynamicButtons = [.bet, .choice, .random]
    }
}
