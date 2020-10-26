//
//  Player.swift
//  challengeFinal
//
//  Created by Ivo Dutra on 22/10/20.
//

/// Save players current points and its storyPath
public class Player {

    // MARK: - Properties

    private(set) var points: Int
    private(set) var path: [NodeID]

    // MARK: - Init

    init(points: Int = 0, path: [NodeID] = []) {
        self.points = points
        self.path = path
    }

    // MARK: - Updates

    func updatePoints(with point: Int) {
        self.points = point
    }

    func updateStoryPathWithNode(id: NodeID) {
        self.path.append(id)
    }

    func updateStoryPath(path: [NodeID]) {
        self.path = path
    }
}
