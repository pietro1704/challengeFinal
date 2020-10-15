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

    func testParse() throws {
        let path = Bundle.main.path(forResource: "StoryNodes", ofType: "json")!
        
        let url = URL(fileURLWithPath: path)
        
        let data = try Data(contentsOf: url)
                
        do {
            let nodes = try JSONDecoder().decode([StoryNode].self, from: data)
            
            
            print(nodes)
        } catch {
            print("erro")
        }
       
    }
}

