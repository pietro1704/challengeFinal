//
//  StoryViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 15/10/20.
//

import UIKit

public class StoryViewModel {

    weak var hudDelegate: HUDViewDelegate?
    weak var delegate: StoryViewModelDelegate?
    var node: StoryNode?
    let service = StoryNodesServices()
    var playerService: PlayerServiceProtocol

    init(node: StoryNode, coordinatorDelegate: StoryViewModelDelegate,
         playerService: PlayerServiceProtocol = PlayerService()) {
        self.node = service.retrieveNode(nodeId: node.id)
        self.delegate = coordinatorDelegate
        self.playerService = playerService
    }

    init(with nodeId: NodeID, playerService: PlayerServiceProtocol = PlayerService()) {
        self.node = service.retrieveNode(nodeId: nodeId)
        self.playerService = playerService
    }

    // MARK: - Navigation

    public func userWantToChoose() {
        delegate?.userWantToChoose()
    }

    public func userFinishedGame() {
        delegate?.userDidFinishChapter()
    }

    // MARK: - HUDDelegate

    public func updateHUD() {
        // Get player's current points
        playerService.initializePlayer()
        hudDelegate?.updateHUD(with: playerService.player.points)
    }

}
