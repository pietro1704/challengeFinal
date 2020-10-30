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

    init(node: StoryNode, coordinatorDelegate: StoryViewModelDelegate,
         playerService: PlayerServiceProtocol = PlayerService()) {
        self.node = service.retrieveNode(nodeId: node.id)
        self.delegate = coordinatorDelegate
        self.playerService = playerService
        self.playerService.saveChoosenNode(id: node.id)
    }

    init(with nodeId: NodeID, playerService: PlayerServiceProtocol = PlayerService()) {
        self.node = service.retrieveNode(nodeId: nodeId)
        self.playerService = playerService
    }

    public func userWantToChoose() {
        delegate?.userWantToChoose()
    }
}
