//
//  storyNode.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 14/10/20.
//

import Foundation
import UIKit

public typealias NodeID = Int

public class StoryNode {

    var id: NodeID
    var childNodes: [StoryNode]?
    var imagePath: String?
    var title: String?
    var text: String

    public init (id: NodeID, childNodes: [StoryNode]?, imagePath: String?, title: String?, text: String) {
        self.id = id
        self.childNodes = childNodes
        self.imagePath = imagePath
        self.title = title
        self.text = text
    }
}
