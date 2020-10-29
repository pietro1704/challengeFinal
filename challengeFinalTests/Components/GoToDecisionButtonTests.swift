//
//  PrimaryButtonTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 15/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

var defaultText = "Tente por você mesmo"

class GoToDecisionButtonTests: XCTestCase {
    func testButton () {
        let button = TransparentButton(title: "Tente por você mesmo")
        let container = button.addInCenterOnMockViewIphone11()

        assertSnapshot(matching: container, as: .image)
    }
    
    func testDefaultLabel () {
        let button = TransparentButton(title: "Tente por você mesmo")
        XCTAssert(button.titleLabel?.text == defaultText)
    }
}
