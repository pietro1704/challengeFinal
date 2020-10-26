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
        let button  = DynamicButton(type: .random, isSelected: true)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    public func testDynamicButtonChoice() {
        let button  = DynamicButton(type: .choice, isSelected: true)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    public func testDynamicButtonBet() {
        let button  = DynamicButton(type: .bet, isSelected: true)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }
    
    public func testDynamicButtonRandomNotSelected() {
        let button  = DynamicButton(type: .random)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    public func testDynamicButtonChoiceNotSelected() {
        let button  = DynamicButton(type: .choice)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }

    public func testDynamicButtonBetNotSelected() {
        let button  = DynamicButton(type: .bet)
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }
    
    public func testButtonDefaultNotSelected(){
        let button = DynamicButton(type: .choice)
        XCTAssertFalse(button.isSelected)
    }
}
