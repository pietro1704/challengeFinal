//
//  RegularTextViewTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 14/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

let defaultFontSize: CGFloat = 17

class RegularTextViewTests: XCTestCase {
    func testTextView () {
        let textView = RegularTextView()
        textView.configure(with: Infos.mock())
        let container = textView.addInCenterOnMockViewIphone11()
        textView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        textView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        assertSnapshot(matching:container, as: .image)
    }
    
    func testTextViewDefaultSize(){
        let textView = RegularTextView()
        XCTAssert(textView.font?.pointSize == defaultFontSize)
    }
    
    func testTextViewWithSize(){
        let fontSize = CGFloat(24)
        let textView = RegularTextView(fontSize: fontSize)
        XCTAssert(textView.font?.pointSize == fontSize)
    }
}

private struct Infos: RegularTextViewInfos {
    var text: String
    // swiftlint:disable line_length
    static func mock() -> Infos {
        return Infos(text: "Até então você tinha pleno controle sobre seus atos. Por mais que o acaso interferisse no mundo, o livre-arbítrio era uma realidade inexorável: você podia tomar a atitude que bem entendesse a qualquer hora. Sim, as forças sociais e morais que regem o mundo sempre regularam suas decisões, mas agora o mais simples ato parece incerto; seja desligar o despertador, se espreguiçar ou até mesmo se levantar do sofá.")
    }
}
