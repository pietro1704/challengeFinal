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

