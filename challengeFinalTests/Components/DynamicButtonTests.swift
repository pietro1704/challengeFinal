//
//  DynamicButtonTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 23/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class DynamicButtonTests: XCTestCase {

    public func testDynamicButtonRandom() {
        let button  = DynamicButton(title: "Aleatório", imagePath: "random")
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    public func testDynamicButtonChoice() {
        let button  = DynamicButton(title: "Escolha", imagePath: "choice")
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    public func testDynamicButtonBet() {
        let button  = DynamicButton(title: "Aposta", imagePath: "bet")
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    public func testDynamicButtonWithLargText() {
        let button  = DynamicButton(title: "EU SOU UM BOTÃO COM O TEXTO GRAAAANDEEE", imagePath: "bet")
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }
    
    
    public func testDynamicButtonRandomNotSelected() {
        let button  = DynamicButton(title: "Aleatório", imagePath: "random", isSelected: false)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    public func testDynamicButtonChoiceNotSelected() {
        let button  = DynamicButton(title: "Escolha", imagePath: "choice", isSelected: false)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    public func testDynamicButtonBetNotSelected() {
        let button  = DynamicButton(title: "Aposta", imagePath: "bet", isSelected: false)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }
}
