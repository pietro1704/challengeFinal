//
//  StoryViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 15/10/20.
//

import UIKit

public class StoryViewModel {

    // Suggestion: change delegate to navigationDelegate
    // Suggestion: change ViewModelDelegate to StoryViewModelDelegate or StoryViewDelegate? Don't know
    weak var viewDelegate: ViewDelegate?
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

    public func userWantToChoose() {
        delegate?.userWantToChoose()
    }

    // MARK: - ViewDelegate

    public func updateHUD() {
        // Get player's current points
        playerService.initializePlayer()
        viewDelegate?.updateHUD(with: playerService.player.points)
    }

}
