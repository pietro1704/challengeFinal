//
//  ChapterViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 22/10/20.
//

import Foundation

public class ChapterViewModel {

    weak var delegate: ChapterViewModelDelegate?
    var node: StoryNode?
    let storyService = StoryNodesServices()
    let playerService: PlayerServiceProtocol
    let eventLogger: LogEventProtocol

    public init(node: StoryNode, coordinatorDelegate: ChapterViewModelDelegate,
                playerService: PlayerServiceProtocol, eventLogger: LogEventProtocol) {
        self.node = node
        self.delegate = coordinatorDelegate
        self.playerService = playerService
        self.eventLogger = eventLogger

        // Note: Refresh Player at each run
        // Initialize player's points
        self.playerService.service.savePoints(999)
        self.playerService.service.saveStoryPath([])
    }

    public init(with nodeId: NodeID, playerService: PlayerServiceProtocol,
                eventLogger: LogEventProtocol) {
        self.node = storyService.retrieveNode(nodeId: nodeId)
        self.playerService = playerService
        self.eventLogger = eventLogger
    }

    public func userWantToShowStory() {
        delegate?.userWantToShowStory()
    }

}

extension ChapterViewModel: LoggableScreen {
    func screenName() -> String {
        return "chapter"
    }
    
    func logger() -> LogEventProtocol? {
        return eventLogger
    }
}
