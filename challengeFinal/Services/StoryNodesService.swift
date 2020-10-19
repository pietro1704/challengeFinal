//
//  StoryNodesService.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 16/10/20.
//

import Foundation

public class StoryNodesServices {
    
    private let jsonName = "StoryNodes"

    func retrieveNode(nodeId: NodeID) -> StoryNode? {
        guard let node = getStoryNode(nodeId) else { return nil }
        
        let storyNode = StoryNode(id: node.id,
                                  childNodes: retrieveChildNodes(childNodes: node.childNodeIDs),
                                  imagePath: node.imagePath,
                                  title: node.title,
                                  text: node.text)
        return storyNode
    }

    private func retrieveChildNodes(childNodes: [Int]?) -> [StoryNode]? {
        guard let nodesId = childNodes else { return nil }

        var childNodes: [StoryNode] = []
        nodesId.forEach({ (childNodeId) in
            guard let childNode = getStoryNode(childNodeId) else { return }
            childNodes.append(StoryNode(id: childNode.id,
                                        childNodes: [],
                                        imagePath: nil,
                                        title: childNode.title,
                                        text: childNode.text))
        })
        
        return childNodes
    }

    private func getStoryNode(_ nodeId: NodeID) -> Node? {
        let nodes = getAllFromFile()?.nodes
        let node = nodes?.filter({ (node) -> Bool in
            return node.id == nodeId
        }).first
        return node
    }

    private func getAllFromFile() -> Story? {
        if let url = Bundle.main.url(forResource: jsonName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                return try decoder.decode(Story.self, from: data)
            } catch {
                debugPrint("error:\(error)")
            }
        }
        return nil
    }
    
}
