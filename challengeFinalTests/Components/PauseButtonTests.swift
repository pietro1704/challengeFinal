//
//  ImageViewTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 13/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class PauseButtonTests: XCTestCase {
    func testButtonImage() {
        let button = PauseButton()
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image, record: true)
    }
}
