//
//  StoryNodesService.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 16/10/20.
//

import Foundation

public class StoryNodesServices {
    
    let repository = StoryNodeRepository()

    func retrieveNode(nodeId: NodeID) -> StoryNode? {
        guard let node = repository.getStoryNode(nodeId) else { return nil }
        
        let storyNode = StoryNode(id: node.id,
                                  childNodes: retrieveChildNodes(node.childNodeIDs),
                                  imagePath: node.imagePath,
                                  title: node.title,
                                  text: node.text)
        return storyNode
    }

    private func retrieveChildNodes(_ nodesId: [Int]) -> [StoryNode] {
        var childNodes: [StoryNode] = []
        nodesId.forEach({ (childNodeId) in
            guard let childNode = repository.getStoryNode(childNodeId) else { return }
            childNodes.append(StoryNode(id: childNode.id,
                                        childNodes: [],
                                        imagePath: nil,
                                        title: childNode.title,
                                        text: childNode.text))
        })
        
        return childNodes
    }
    
}
