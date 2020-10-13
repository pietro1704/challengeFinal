//
//  ImageViewTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 13/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class ImageViewTests: XCTestCase {
    func testImageView () {
        let imageView = ImageView()
        imageView.backgroundColor = .red
        let container = imageView.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }
}
