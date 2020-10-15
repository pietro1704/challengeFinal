//
//  storyNode.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 14/10/20.
//

import Foundation
import UIKit

typealias NodeID = Int
struct StoryNode: StoryNodeProtocol, Codable {

    var id: NodeID
    var childNodeIDs: [NodeID]? = [NodeID]()
    var imagePath: String?
    var title: String? //talvez?
    var text: String
}

protocol StoryNodeProtocol: Codable {
    var id: NodeID { get set }
    var childNodeIDs: [NodeID]? { get set }
    var imagePath: String? { get set }
    var title: String? { get set }
    var text: String { get set }
}
