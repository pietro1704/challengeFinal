//
//  PlayerDataService.swift
//  challengeFinal
//
//  Created by Ivo Dutra on 23/10/20.
//

import Foundation

public protocol PlayerDataServiceProtocol {
    func getPoints() -> Int
    func savePoints(_ points: Int)
    func getStoryPath() -> [Int]
    func saveStoryPath(_ idArray: [Int])
}

/// Used only to access and save Players Data info in UserDefaults
class PlayerDataService: PlayerDataServiceProtocol {

    // MARK: - Properties

    /// For dependency injection in Unit Tests
    let instance: UserDefaults
    let storyPathString = "storyPath"
    let pointsString = "points"

    // MARK: - Init

    init(instance: UserDefaults = UserDefaults.standard) {
        self.instance = instance
    }

    // MARK: - Methods

    func getPoints() -> Int {
        return instance.object(forKey: pointsString) as? Int ?? 0
    }

    func getStoryPath() -> [NodeID] {
        return instance.object(forKey: storyPathString) as? [Int] ?? []
    }

    func savePoints(_ points: Int) {
        instance.setValue(points, forKey: pointsString)
    }

    func saveStoryPath(_ idArray: [NodeID]) {
        instance.setValue(idArray, forKey: storyPathString)
    }
}