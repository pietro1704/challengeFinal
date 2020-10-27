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
    var playerService: PlayerServiceProtocol

    public init(node: StoryNode, coordinatorDelegate: StoryViewModelDelegate, playerService: PlayerServiceProtocol) {
        self.node = node
        self.delegate = coordinatorDelegate
        self.playerService = playerService

        //  When a node is initialized, its id is saved
        self.playerService.saveChoosenNode(id: node.id)
    }

    public init(with nodeId: NodeID, playerService: PlayerServiceProtocol) {
        self.node = service.retrieveNode(nodeId: nodeId)
        self.playerService = playerService
    }

    public func userChoosedNode(_ childIndex: NodeID) {
        guard let nodeId = self.node?.childNodes?[childIndex].id else { return }
        if let node = self.service.retrieveNode(nodeId: nodeId) {
            self.delegate?.userChoosedNode(node)
        }
    }
}
