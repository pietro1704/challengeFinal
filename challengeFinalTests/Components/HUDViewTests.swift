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
    func testView() {
        let hud = HUDView()
       
        hud.backgroundColor = .blue
        let container = hud.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image, record: true)
    }
}
