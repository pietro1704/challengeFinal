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

    public init(node: StoryNode, coordinatorDelegate: ChapterViewModelDelegate, playerService: PlayerServiceProtocol) {
        self.node = node
        self.delegate = coordinatorDelegate
        self.playerService = playerService

        // Note: Refresh Player at each run
        self.playerService.service.savePoints(0)
        self.playerService.service.saveStoryPath([])
    }

    public init(with nodeId: NodeID, playerService: PlayerServiceProtocol) {
        self.node = storyService.retrieveNode(nodeId: nodeId)
        self.playerService = playerService
    }

    public func userWantToStartChapter() {
        delegate?.userWantToStartChapter()
    }

}
