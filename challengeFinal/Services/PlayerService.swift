//
//  PlayerService.swift
//  challengeFinal
//
//  Created by Ivo Dutra on 26/10/20.
//

import Foundation

public protocol PlayerServiceProtocol {
    var player: Player { get set }
    var service: PlayerDataServiceProtocol { get set }

    func initializePlayer()
    func increasePlayerPoints(by newPoint: Int)
    func decreasePlayerPoints(by newPoint: Int)
    func saveChoosenNode(id: NodeID)
}

/// Has both Player and PlayerDataService
class PlayerService: PlayerServiceProtocol {

    // MARK: - Properties

    /// For dependency injection in Unit Tests
    var player: Player
    var service: PlayerDataServiceProtocol

    // MARK: - Init

    init(service: PlayerDataServiceProtocol = PlayerDataService()) {
        self.player = Player()
        self.service = service

        // Start game by loading the current state from the player
        initializePlayer()
    }

    // MARK: - Methods

    func initializePlayer() {
        player.updatePoints(with: service.getPoints())
        player.updateStoryPath(path: service.getStoryPath())
    }

    // Add points to player and persist change
    func increasePlayerPoints(by newPoint: Int = 1) {
        let newPoints = player.points + newPoint
        player.updatePoints(with: newPoints)
        service.savePoints(newPoint)
    }

    // Take points from player and persist change
    func decreasePlayerPoints(by newPoint: Int = 1) {
        let newPoints = player.points - newPoint
        player.updatePoints(with: newPoints)
        service.savePoints(newPoint)
    }

    // Save path taken and persist change
    func saveChoosenNode(id: NodeID) {
        player.updateStoryPathWithNode(id: id)
        service.saveStoryPath(player.path)
    }

}
