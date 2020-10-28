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
    var selectedDynamic: DynamicTypes? { get set }
    var selectedNode: StoryNode? { get set }
    var highlightedNode: NodeID? { get set }
    var canChooseNode: Bool { get set }
}

public struct ChoiceViewInfosObject: ChoiceViewInfos {
    
    public var selectedNode: StoryNode?
    public var selectedDynamic: DynamicTypes?
    public var dynamicButtons: [DynamicTypes]
    public var nodes: [StoryNode]
    public var tintColor: String
    public var canChooseNode: Bool = false
    public var highlightedNode: NodeID?

    init(nodes: [StoryNode], selectedDynamic: DynamicTypes?, selectedNode: StoryNode?, highlightedNode: NodeID?) {
        self.nodes = nodes
        self.tintColor = "Red"
        self.dynamicButtons = [.choice, .bet, .random]
        self.selectedNode = selectedNode
        self.selectedDynamic = selectedDynamic
        self.highlightedNode = highlightedNode
        if let selectedDynamic = selectedDynamic {
            self.canChooseNode = selectedDynamic != .random
        }
    }
}
