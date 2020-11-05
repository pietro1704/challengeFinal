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

    public init(coordinatorDelegate: MenuViewModelDelegate, playerService: PlayerServiceProtocol) {
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
