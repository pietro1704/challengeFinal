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
        let button = PrimaryButton(title: "“Vem cá, Arguinhos! Dá um beijinho no papai, vem!”“Vem cá, Arguinhos! Dá um beijinho.")
        let container = button.addInCenterOnMockViewIphone11()
        button.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 100).isActive = true
        button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -100).isActive = true
        assertSnapshot(matching: container, as: .image)
    }
}
