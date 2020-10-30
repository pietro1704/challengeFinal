//
//  ImageViewTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 13/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class HUDViewTests: XCTestCase {
    func testHUDView() {
        let hud = HUDView()

        let container = hud.addInCenterAndSidesOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }
}
