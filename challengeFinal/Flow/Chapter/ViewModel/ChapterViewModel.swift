//
//  ChapterViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 22/10/20.
//

import Foundation

public class ChapterViewModel {

//    weak var delegate: ChapterViewModelDelegate?
    var node: StoryNode?
    let service = StoryNodesServices()

    public init(node: StoryNode) {
        self.node = node
//        self.delegate = coordinatorDelegate
    }

    public init(with nodeId: NodeID) {
        self.node = service.retrieveNode(nodeId: nodeId)
    }

}
