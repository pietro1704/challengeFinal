//
//  Story.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 16/10/20.
//

// MARK: - Story
public struct Story: Codable {
    let nodes: [Node]
}

// MARK: - Node
public struct Node: Codable {
    let id: NodeID
    let imagePath: String?
    let title, text: String
    let childNodeIDs: [NodeID]?
}
