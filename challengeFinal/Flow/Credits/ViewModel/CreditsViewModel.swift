//
//  MenuViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 05/11/20.
//

import UIKit

public protocol CreditsViewModelDelegate: class {
    
}

public class CreditsViewModel {

    var imagePath: String = "menu"

    public init(coordinatorDelegate: CreditsViewModelDelegate, playerService: PlayerServiceProtocol) {
        self.delegate = coordinatorDelegate
        self.playerService = playerService
        self.userCanContinue = playerService.getLastNode() != nil
    }

    public func userWantToStartNewGame() {
        delegate?.userWantToStartNewGame()
    }
    
    func userWantToContinueGame() {
        if let node = playerService.getLastNode() {
            delegate?.userWantToContinueGame(from: node)
        }
    }
}
