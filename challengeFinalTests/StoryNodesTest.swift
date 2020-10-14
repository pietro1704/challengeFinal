//
//  StoryNodesTest.swift
//  challengeFinalTests
//
//  Created by Pietro Pugliesi on 14/10/20.
//

import XCTest
@testable import challengeFinal

class StoryNodesTest: XCTestCase {

    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        var node1 = StoryNode(id: 0, text: "escolha1")
        var node2 = StoryNode(id: 1, text: "escolha2")
        var node3 = StoryNode(id: 2, text: "escolha3")
        var node4 = StoryNode(id: 3, text: "escolha4")
        var node5 = StoryNode(id: 4, text: "escolha5")
        
        node1.addChild(2, 3)
        node3.addChild(4, 5)
        node4.addChild(5)
        
        
        // This is an example of a functional test case.
        print(node1)
        print(node2)
        print(node3)
        print(node4)
        print(node5)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
