//
//  ChapterinitLabelTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 21/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class ChapterinitLabelTests: XCTestCase {
    func testLabel () {
        let label = ChapterinitLabel(with: "Capítulo 1  - Fiz coisas boas que me trouxeram prejuízo.", colorName: "Red")
        let container = label.addInCenterOnMockViewIphone11()
        container.backgroundColor = .white
        assertSnapshot(matching: container, as: .image)
    }
}
