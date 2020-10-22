//
//  ChapterViewTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 22/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class ChapterViewTests: XCTestCase {
    func testChapterView () {
        let view = ChapterView(title: "Capítulo 1  - Fiz coisas boas que me trouxeram prejuízo.",
                                imagePath: "coxinha")
        view.translatesAutoresizingMaskIntoConstraints = false
        let container = view.addInCenterOnMockViewIphone11Landscape()
        container.backgroundColor = .white
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: container.topAnchor),
            view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        assertSnapshot(matching: container, as: .image)
    }
}
