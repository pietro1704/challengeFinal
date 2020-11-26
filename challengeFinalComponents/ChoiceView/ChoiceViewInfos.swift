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
    var canChooseNode: Bool { get set }
    var nodeToEndAnimation: StoryNode? { get set }
    var playerPoints: Int { get set }
}

public struct ChoiceViewInfosObject: ChoiceViewInfos {
    
    public var selectedNode: StoryNode?
    public var selectedDynamic: DynamicTypes?
    public var dynamicButtons: [DynamicTypes]
    public var nodes: [StoryNode]
    public var tintColor: String
    public var canChooseNode: Bool = false
    public var nodeToEndAnimation: StoryNode?
    public var playerPoints: Int

    init(nodes: [StoryNode], selectedDynamic: DynamicTypes?, dynamicButtons: [DynamicTypes],
         selectedNode: StoryNode?, highlightedNode: NodeID?, nodeToEndAnimation: StoryNode?,
         playerPoints: Int) {
        self.nodes = nodes
        self.tintColor = "Red"
        self.selectedNode = selectedNode
        self.nodeToEndAnimation = nodeToEndAnimation

        self.dynamicButtons = playerPoints == 0 ? [.random] : dynamicButtons
        self.selectedDynamic = playerPoints == 0 ? .random : selectedDynamic
        self.canChooseNode = self.selectedDynamic != .random

        self.playerPoints = playerPoints
    }
}
