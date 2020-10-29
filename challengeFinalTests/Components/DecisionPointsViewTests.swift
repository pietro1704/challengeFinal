//
//  ImageViewTests.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 13/10/20.
//

import XCTest
@testable import challengeFinal
import SnapshotTesting

class DecisionPointsViewTests: XCTestCase {
    func testDecisionPointsView() {
        let decisionView = DecisionPointsView()
       
        let container = decisionView.addInCenterOnMockViewIphone11()
        assertSnapshot(matching: container, as: .image)
    }
    
    func testLabelDefaultSize(){
        let decisionView = DecisionPointsView()
        
        XCTAssert(decisionView.pointsLabel.font.pointSize == 24)
    }
    
    func testLabelSize(){
        let decisionView = DecisionPointsView(textSize: 100)
        
        XCTAssert(decisionView.pointsLabel.font.pointSize == 100)
    }
}
