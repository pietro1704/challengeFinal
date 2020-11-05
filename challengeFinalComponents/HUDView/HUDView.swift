//
//  HUDView.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 28/10/20.
//

import Foundation
import UIKit

public class HUDView: UIView {
    
    private lazy var pauseButton: PauseButton = {
        let pause = PauseButton()
        pause.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pause)
        return pause
    }()
    
    public lazy var decisionPointsView: PointsView = {
        let decision = PointsView()
        // TranslatesAutoresizingMaskIntoConstraints was set in View Init

        self.addSubview(decision)
        return decision
    }()

    init() {
        super.init(frame: .zero)
        setupConstrains()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrains() {
        // Constraint on icon image
        decisionPointsView.iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        decisionPointsView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        decisionPointsView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        pauseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        pauseButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        pauseButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
}
