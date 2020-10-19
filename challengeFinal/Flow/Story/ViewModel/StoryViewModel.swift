//
//  StoryViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 15/10/20.
//

import UIKit

public class StoryViewModel {
    var node: StoryNode?
    let service = StoryNodesServices()

    public init(node: StoryNode) {
        self.node = node
    }

    public init(with nodeId: NodeID) {
        self.node = service.retrieveNode(nodeId: nodeId)
    }
}
