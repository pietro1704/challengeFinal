//
//  ChoiceViewTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 26/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class ChoiceViewTests: XCTestCase {

    func testView() {
//        let view = ChoiceView()
//        view.update(with: Infos.mock())
//        view.translatesAutoresizingMaskIntoConstraints = false
//        let container = view.addInCenterOnMockViewIphone11Landscape()
//        NSLayoutConstraint.activate([
//            view.topAnchor.constraint(equalTo: container.topAnchor),
//            view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
//            view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
//            view.bottomAnchor.constraint(equalTo: container.bottomAnchor)
//        ])
//        assertSnapshot(matching: container, as: .image)
    }

}

private struct Infos: ChoiceViewInfos {
    var selectedDynamic: DynamicTypes?
    
    var selectedNode: StoryNode?
    
    var highlightedNode: NodeID?
    
    var canChooseNode: Bool
    
    var dynamicButtons: [DynamicTypes]
    var nodes: [StoryNode]
    var tintColor: String
    
//    static func mock() -> ChoiceViewInfos {
//        return Infos(dynamicButtons: [.bet, .choice, .random],
//                     nodes: [StoryNode(id: 1, childNodes: [], imagePath: nil, title: "Node 1", text: "Node 1"),
//                             StoryNode(id: 2, childNodes: [], imagePath: nil, title: "Node 2", text: "Node 2"),
//                             StoryNode(id: 3, childNodes: [], imagePath: nil, title: "Node 3", text: "Node 3")],
//                     tintColor: "Red")
//    }
}
