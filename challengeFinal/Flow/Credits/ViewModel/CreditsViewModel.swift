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
    var userCanContinue: Bool
    var text = "Pietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaoPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro GuizaPietro Guiza"
    
    public init(coordinatorDelegate: CreditsViewModelDelegate, playerService: PlayerServiceProtocol) {
        self.delegate = coordinatorDelegate
        self.playerService = playerService
        self.userCanContinue = playerService.getLastNode() != nil
    }

    public func userWantToStartNewGame() {
        delegate?.userWantToStartNewGame()
    }
    
    public func userWantToGoToMenu() {
        delegate?.userWantToGoToMenu()
    }
}
