//
//  BackButton.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 22/10/20.
//

import UIKit

public protocol PauseButtonDelegate: class {
    func pauseButtonPressed()
}

class PauseButton: UIButton {
    public weak var delegate: PauseButtonDelegate?

    public init(for state: UIControl.State = .normal, accentColor: String = "Red") {
        super.init(frame: .zero)
        tintColor = UIColor(named: accentColor)
        setupButton(for: state)
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    @objc private func handleTap() {
        self.delegate?.pauseButtonPressed()
    }
    
    private func setupButton(for state: UIControl.State) {
        self.backgroundColor = .clear
        
        if let image = UIImage(systemName: "pause.circle") {
            self.setImage(image, for: state)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
