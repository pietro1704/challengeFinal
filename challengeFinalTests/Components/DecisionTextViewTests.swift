//
//  RegularTextViewTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 14/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class DecisionTextViewTests: XCTestCase {
    func testStackView () {
        let decisionTextView = RegularTextView()
        
        decisionTextView.configure(with: Infos.mock())
        let container = decisionTextView.addInCenterOnMockViewIphone11()
        decisionTextView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        decisionTextView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        assertSnapshot(matching: container, as: .image)
    }
}

private struct Infos: RegularTextViewInfos {
    var text: String
    
    static func mock() -> Infos {
        return Infos(text: "“Vem cá, Arguinhos! Dá um beijinho no papai, vem!”“Vem cá, Arguinhos! Dá um beijinho..")
    }
}
