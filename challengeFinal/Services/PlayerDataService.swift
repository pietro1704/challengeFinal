//
//  PlayerDataService.swift
//  challengeFinal
//
//  Created by Ivo Dutra on 23/10/20.
//

import Foundation

protocol PlayerDataServiceProtocol {
    func getPoints() -> Int
    func savePoints(_ points: Int)
    func getStoryPath() -> [Int]
    func saveStoryPath(_ idArray: [Int])
}

/// Used only to access and savePlayers Data info in UserDefaults
class PlayerDataService: PlayerDataServiceProtocol {

    let storyPathString = "storyPath"
    let pointsString = "points"
    
    func getPoints() -> Int {
        return UserDefaults.standard.object(forKey: pointsString) as? Int ?? 0
    }

    func savePoints(_ points: Int) {
        UserDefaults.standard.setValue(points, forKey: pointsString)
    }

    func getStoryPath() -> [Int] {
        return UserDefaults.standard.object(forKey: storyPathString) as? [Int] ?? []
    }

    func saveStoryPath(_ idArray: [Int]) {
        UserDefaults.standard.setValue(idArray, forKey: storyPathString)
    }
}
