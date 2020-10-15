//
//  storyNode.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 14/10/20.
//

import Foundation
import UIKit

typealias NodeID = Int
struct StoryNode: Identifiable {
    
    var id: NodeID
    var childNodeIDs = [NodeID]()
    var imagePath: String?
    var title: String? //talvez?
    var text: String
    
    /// Adds 1 or more (...) children to the node
    /// - Parameter : sequence of nodes (1 or +) to add
    mutating func addChild(_ childrenIDs: NodeID...) {
        self.childNodeIDs.append(contentsOf: childrenIDs)
    }
}
