//
//  MenuViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 05/11/20.
//

import UIKit

public protocol MenuViewModelDelegate: class {
    func userWantToStartNewGame()
    func userWantToContinueGame(from: StoryNode)
}

public class MenuViewModel {

    weak var delegate: MenuViewModelDelegate?
    var imagePath: String = "menu"
    var userCanContinue: Bool

    let storyService = StoryNodesServices()
    let playerService: PlayerServiceProtocol
    let eventLogger: LogEventProtocol

    public init(coordinatorDelegate: MenuViewModelDelegate, playerService: PlayerServiceProtocol,
                eventLogger: LogEventProtocol) {
        self.delegate = coordinatorDelegate
        self.playerService = playerService
        self.userCanContinue = playerService.getLastNode() != nil
        self.eventLogger = eventLogger
    }

    public func userWantToStartNewGame() {
        eventLogger.logEvent("start_new_game", parameters: nil)
        delegate?.userWantToStartNewGame()
    }
    
    func userWantToContinueGame() {
        if let node = playerService.getLastNode() {
            eventLogger.logEvent("continue_game", parameters: ["nodeID": node.id])
            delegate?.userWantToContinueGame(from: node)
        }
    }
}

extension MenuViewModel: LoggableScreen {
    func screenName() -> String {
        "menu"
    }
    
    func logger() -> LogEventProtocol? {
        return eventLogger
    }
}
