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
    
    func testStoryNodesCreation() {
        let node1 = StoryNode(id: 1,
                              childNodes: [],
                              imagePath: nil,
                              title: "decisão1",
                              text: "Titulo Decisão 1")
        let node2 = StoryNode(id: 2,
                              childNodes: [],
                              imagePath: nil,
                              title: "decisão2",
                              text: "Titulo Decisão 2")
        let node0 = StoryNode(id: 0,
                              childNodes: [node1, node2],
                              imagePath: nil,
                              title: "decisão0",
                              text: "Titulo Decisão 0")
        
        XCTAssertEqual(node1.title, "decisão1")
        XCTAssertEqual(node2.title, "decisão2")
        XCTAssertEqual(node0.title, "decisão0")

    }
    
    func testParse() throws {
        let path = Bundle.main.path(forResource: "StoryNodes", ofType: "json")!
        
        let fileLocation = URL(fileURLWithPath: path)
        
        let data = try Data(contentsOf: fileLocation)

        do {
            let nodes = try JSONDecoder().decode(Story.self, from: data)
            let unwrapedStory = try XCTUnwrap(nodes)
            XCTAssertEqual(unwrapedStory.nodes.first?.title, "Prólogo")
        } catch let jsonerror as NSError {
            print(jsonerror.localizedDescription)
        }
    }
}
