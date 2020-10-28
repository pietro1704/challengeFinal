//
//  HUDView.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 28/10/20.
//

import Foundation
import UIKit

class HUDView: UIStackView{
    
    private lazy var pauseButton: PauseButton = {
        let pause = PauseButton()
        pause.translatesAutoresizingMaskIntoConstraints = false
        return pause
    }()
    
    private lazy var decisionPointsView: DecisionPointsView = {
        let decision = DecisionPointsView()
        decision.translatesAutoresizingMaskIntoConstraints = false
        return decision
    }()

    
    init(){
        super.init(frame: .zero)
        setupConstrains()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrains(){
        self.addArrangedSubview(decisionPointsView)
        self.addArrangedSubview(pauseButton)
        self.axis = .horizontal
        self.alignment = .fill
        self.spacing = 8
    }
}
