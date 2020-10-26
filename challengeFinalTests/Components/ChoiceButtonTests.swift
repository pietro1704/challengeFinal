//
//  ChoiceButtonTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 23/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class ChoiceButtonTests: XCTestCase {
    
    func testChoiceButton() {
        let button = ChoiceButton(buttonText: "Vem cá, Arguinhos! Dá um beijinho no papai, vem!”“Vem cá, Arguinhos! Dá um beijinho.", colorName: "Red")
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    func testChoiceButtonHighlighted() {
        let button = ChoiceButton(buttonText: "Vem cá, Arguinhos! Dá um beijinho no papai, vem!”“Vem cá, Arguinhos! Dá um beijinho.", colorName: "Red")
        button.update(isHighlighted: true, isSelected: nil)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    func testChoiceButtonSelected() {
        let button = ChoiceButton(buttonText: "Vem cá, Arguinhos! Dá um beijinho no papai, vem!”“Vem cá, Arguinhos! Dá um beijinho.", colorName: "Red")
        button.update(isHighlighted: nil, isSelected: true)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    func testChoiceButtonSelectedAndHightlighted() {
        let button = ChoiceButton(buttonText: "Vem cá, Arguinhos! Dá um beijinho no papai, vem!”“Vem cá, Arguinhos! Dá um beijinho.", colorName: "Red")
        button.update(isHighlighted: true, isSelected: true)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    func testChoiceButtonSmallArea() {
        let button = ChoiceButton(buttonText: "Vem cá, Arguinhos! Dá um beijinho no papai, vem!”“Vem cá, Arguinhos! Dá um beijinho.", colorName: "Red")
        button.update(isHighlighted: true, isSelected: true)
        button.translatesAutoresizingMaskIntoConstraints = true
        let container = button.addInCenterOnMockViewIphone11()
        button.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 200).isActive = true
        button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -200).isActive = true
        assertSnapshot(matching: container, as: .image)
    }
}
