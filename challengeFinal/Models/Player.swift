//
//  Player.swift
//  challengeFinal
//
//  Created by Ivo Dutra on 22/10/20.
//

/// Save players current points and its storyPath
class Player {

    // MARK: - Properties

    var points: Int
    var path: [NodeID]

    // MARK: - Init

    init(points: Int, path: [NodeID]) {
        self.points = points
        self.path = path
    }
}
