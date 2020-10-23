//
//  ImageViewTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 13/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class BackButtonTests: XCTestCase {
    func testButtonImage() {
        let button = BackButton()
        let container = button.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }
}
