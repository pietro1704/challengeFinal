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
        if let image = UIImage(named: "cap1_1") {
            imageView.recievedImage(image: image)
        }
        imageView.backgroundColor = UIColor.accentRed
        let container = imageView.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }
}
