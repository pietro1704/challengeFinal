//
//  StoryNodeManager.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 14/10/20.
//

import Foundation

struct StoryNodeManager {
    var storyNodes = [StoryNode]()
    
    func getNodeByID(id: NodeID) -> StoryNode? {
        let nodeIndex = storyNodes.firstIndex { (node) -> Bool in
            node.id == id
        }
        guard let nodeIndexUnwrap = nodeIndex else { return nil}
        return storyNodes[nodeIndexUnwrap]
    }
}
