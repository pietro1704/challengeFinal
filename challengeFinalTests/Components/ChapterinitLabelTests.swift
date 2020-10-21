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
        let label = ChapterinitLabel(with: "Capítulo 1")
        label.backgroundColor = .green
        let container = label.addInCenterOnMockViewIphone11()
        container.backgroundColor = .white
        label.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        assertSnapshot(matching: container, as: .image, record: true)
    }
}
