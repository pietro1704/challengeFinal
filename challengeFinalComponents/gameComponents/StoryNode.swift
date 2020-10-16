//
//  storyNode.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 14/10/20.
//

import Foundation
import UIKit

typealias NodeID = Int

class StoryNode: StoryNodeProtocol, Codable {
    
    internal init(id: NodeID, text: String) {
        self.id = id
        self.text = text
    }
    
    var id: NodeID
    var childNodeIDs: [NodeID]?
    var imagePath: String?
    var title: String? //talvez?
    var text: String
}

protocol StoryNodeProtocol{
    var id: NodeID { get set }
    var childNodeIDs: [NodeID]? { get set }
    var imagePath: String? { get set }
    var title: String? { get set }
    var text: String { get set }
}
