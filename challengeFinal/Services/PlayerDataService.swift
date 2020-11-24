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
    func getLastNode() -> StoryNode?
    func getUserSawOnboarding() -> Bool
    func setUserFinishedOnboarding()
}

/// Used only to access and save Players Data info in UserDefaults
class PlayerDataService: PlayerDataServiceProtocol {

    // MARK: - Properties

    /// For dependency injection in Unit Tests
    let instance: UserDefaults
    let storyPathString = "storyPath"
    let pointsString = "points"
    let sawOnboarding = "onboarding"

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

    func getLastNode() -> StoryNode? {
        guard let nodeId = getStoryPath().last else { return nil }
        let nodeService = StoryNodesServices()
        return nodeService.retrieveNode(nodeId: nodeId)
    }
    
    func getUserSawOnboarding() -> Bool {
        return (instance.object(forKey: sawOnboarding) as? Bool) ?? false
    }
    
    func setUserFinishedOnboarding() {
        instance.setValue(true, forKey: sawOnboarding)
    }
}
