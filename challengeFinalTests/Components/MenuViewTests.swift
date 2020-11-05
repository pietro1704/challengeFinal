//
//  MenuViewTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 05/11/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class MenuViewTests: XCTestCase {

    func testView() {
        let view = MenuView()
        if let image = UIImage(named: "coxinha") {
            view.received(image: image)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        let container = view.addInCenterOnMockViewIphone11Landscape()
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: container.topAnchor),
            view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        assertSnapshot(matching: container, as: .image)
    }

}
