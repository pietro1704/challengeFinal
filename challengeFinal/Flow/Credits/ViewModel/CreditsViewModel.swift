//
//  MenuViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 05/11/20.
//

import UIKit

public protocol CreditsViewModelDelegate: class {
    func userWantToStartNewGame()
    func userWantToGoToMenu()
}

public class CreditsViewModel {
    
    weak var delegate: CreditsViewModelDelegate?
    var imagePath: String = "menu"
    let storyService = StoryNodesServices()
    let playerService: PlayerServiceProtocol
    let eventLogger: LogEventProtocol

    var userCanContinue: Bool
    var text = "Pietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro Guiza"
    
    public init(coordinatorDelegate: CreditsViewModelDelegate, playerService: PlayerServiceProtocol,
                eventLogger: LogEventProtocol) {
        self.delegate = coordinatorDelegate
        self.playerService = playerService
        self.userCanContinue = playerService.getLastNode() != nil
        self.eventLogger = eventLogger
        eventLogger.saveUserProperty(property: "end", key: "end_chapter")
    }

    public func userWantToStartNewGame() {
        eventLogger.logEvent("start_new_game_from_credits", parameters: nil)
        delegate?.userWantToStartNewGame()
    }
    
    public func userWantToGoToMenu() {
        eventLogger.logEvent("show_menu_from_credits", parameters: nil)
        delegate?.userWantToGoToMenu()
    }
}

extension CreditsViewModel: LoggableScreen {
    func screenName() -> String {
        return "credits"
    }
    
    func logger() -> LogEventProtocol? {
        return eventLogger
    }
}
