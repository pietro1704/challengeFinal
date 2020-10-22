//
//  StoryViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 15/10/20.
//

import UIKit

public class StoryViewModel {

    weak var delegate: StoryViewModelDelegate?
    var node: StoryNode?
    let service = StoryNodesServices()

    public init(node: StoryNode, coordinatorDelegate: StoryViewModelDelegate) {
        self.node = node
        self.delegate = coordinatorDelegate
    }

    public init(with nodeId: NodeID) {
        self.node = service.retrieveNode(nodeId: nodeId)
    }

    public func userChoosedNode(_ childIndex: NodeID) {
        guard let nodeId = self.node?.childNodes?[childIndex].id else { return }
        if let node = self.service.retrieveNode(nodeId: nodeId) {
            self.delegate?.userChoosedNode(node)
        }
    }
}
