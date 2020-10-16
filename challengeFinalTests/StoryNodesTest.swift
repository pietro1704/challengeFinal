//
//  StoryNodesTest.swift
//  challengeFinalTests
//
//  Created by Pietro Pugliesi on 14/10/20.
//

import XCTest
import Foundation
@testable import challengeFinal

class StoryNodesTest: XCTestCase {
    
    
    func testStoryNodesCreation() throws{
        var node1 = StoryNode(id: 0, text: "decisão1")
        var node2 = StoryNode(id: 1, text: "decisão2")
        var node3 = StoryNode(id: 2, text: "decisão3")
        var node4 = StoryNode(id: 3, text: "decisão4")
        var node5 = StoryNode(id: 4, text: "decisão5")
        
        
        var storyNodes = [node1, node2, node3, node4, node5]
        
        node1.childNodeIDs = [2, 3]
        node3.childNodeIDs = [4]
        node4.childNodeIDs = [5]
        
        for node in storyNodes{
            var i = 1
            print("node\(i): \(node)")
            i += 1
        }
    }
    
    func testParse() throws {
        let path = Bundle.main.path(forResource: "StoryNodes", ofType: "json")!
        
        let fileLocation = URL(fileURLWithPath: path)
        
        let data = try Data(contentsOf: fileLocation)
        
        //JSON loads correctly
        //let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
        do {
            let nodes = try JSONDecoder().decode([StoryNode].self, from: data)
            
        } catch let jsonerror as NSError {
            print(jsonerror.localizedDescription)
        }
    }
}

