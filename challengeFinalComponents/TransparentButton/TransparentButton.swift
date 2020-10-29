//
//  GoToDecisionButton.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 28/10/20.
//

import Foundation
import UIKit

public protocol BackButtonDelegate: class {
    func backButtonPressed()
}

public protocol gotodecisionDelegate: class {
    func backButtonPressed()
}

class TransparentButton: UIButton {
    public weak var backButtonDelegate: BackButtonDelegate?
    
    public weak var gotodecisionDelegate: gotodecisionDelegate?

    public init(title: String, for state: UIControl.State = .normal) {
        super.init(frame: .zero)
        setTitle(title, for: state)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update(title: String, for state: UIControl.State = .normal) {
        setTitle(title, for: state)
    }

    private func setupButton() {
        self.backgroundColor = .clear
        
        self.setTitleColor(.black, for: .normal)
        setupButtonText()
    }

    private func setupButtonText() {
        guard let titleLabel = self.titleLabel else { return }
        
        titleLabel.font = UIFont.preferredFont(for: .headline, weight: .bold)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.required, for: .horizontal)
    }
}
