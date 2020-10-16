//
//  PrimaryButtonTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 15/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class PrimaryButtonTests: XCTestCase {
    func testButton () {
        let button = PrimaryButton(title: "Button test")
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }
}
