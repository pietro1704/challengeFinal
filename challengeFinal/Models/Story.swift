//
//  Story.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 16/10/20.
//

// MARK: - Story
struct Story: Codable {
    let nodes: [Node]
}

// MARK: - Node
struct Node: Codable {
    let id: NodeID
    let imagePath: String?
    let title, text: String
    let childNodeIDs: [NodeID]?
}
