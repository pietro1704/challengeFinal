//
//  StoryNodeRepository.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 21/10/20.
//

import Foundation

public class StoryNodeRepository {
    
    private let jsonName = "StoryNodes"
    
    private static var story: Story?

    public func getStoryNode(_ nodeId: NodeID) -> Node? {
        let nodes = getAllNodes()?.nodes
        let node = nodes?.filter({ (node) -> Bool in
            return node.id == nodeId
        }).first
        return node
    }

    public func getAllNodes() -> Story? {
        guard let story = StoryNodeRepository.story else {
            StoryNodeRepository.story = self.getAllFromFile()
            return StoryNodeRepository.story
        }
        
        return story
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
