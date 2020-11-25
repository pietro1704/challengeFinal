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
    let eventLogger: LogEventProtocol

    init(node: StoryNode, coordinatorDelegate: StoryViewModelDelegate,
         playerService: PlayerServiceProtocol = PlayerService(), eventLogger: LogEventProtocol) {
        self.node = service.retrieveNode(nodeId: node.id)
        self.delegate = coordinatorDelegate
        self.playerService = playerService
        self.eventLogger = eventLogger
    }

    init(with nodeId: NodeID, playerService: PlayerServiceProtocol = PlayerService(),
         eventLogger: LogEventProtocol) {
        self.node = service.retrieveNode(nodeId: nodeId)
        self.playerService = playerService
        self.eventLogger = eventLogger
    }

    // MARK: - Navigation

    public func userWantToChoose() {
        eventLogger.logEvent("start_choose", parameters: nil)
        delegate?.userWantToChoose()
    }

    public func userFinishedGame() {
        eventLogger.logEvent("finish_chapter", parameters: nil)
        delegate?.userDidFinishChapter()
    }

    // MARK: - HUDDelegate

    public func updateHUD() {
        // Get player's current points
        playerService.initializePlayer()
        hudDelegate?.updateHUD(with: playerService.player.points)
    }

}

extension StoryViewModel: LoggableScreen {
    func screenName() -> String {
        return "story"
    }
    
    func logger() -> LogEventProtocol? {
        return eventLogger
    }
}
