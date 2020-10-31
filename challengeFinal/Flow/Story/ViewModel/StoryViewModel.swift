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
    }

    init(with nodeId: NodeID, playerService: PlayerServiceProtocol = PlayerService()) {
        self.node = service.retrieveNode(nodeId: nodeId)
        self.playerService = playerService
    }

    public func userWantToChoose() {
        delegate?.userWantToChoose()
    }

    // MARK: - HUD

    func updateHUD(pointsView: PointsView) {
        // Save path and update HUD
        let currentPoints = playerService.player.points
        playerService.saveChoosenNode(id: node?.id ?? 0)
        pointsView.updateLabel(withPoints: currentPoints)
    }
}
