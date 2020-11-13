//
//  GoToDecisionButton.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 28/10/20.
//

import Foundation
import UIKit

public protocol TransparentButtonDelegate: class {
    func transpButtonPressed()
}

class TransparentButton: UIButton {
    public weak var delegate: TransparentButtonDelegate?

    public init(title: String, for state: UIControl.State = .normal) {
        super.init(frame: .zero)
        setTitle(title, for: state)
        setupButton()
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func handleTap() {
        delegate?.transpButtonPressed()
    }
    
    public func update(title: String, for state: UIControl.State = .normal) {
        setTitle(title, for: state)
    }

    public func changeButton(to isEnable: Bool) {
        self.isEnabled = isEnable
        self.alpha = isEnable ? 1 : 0.3
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
        
        titleLabel.adjustsFontForContentSizeCategory = true

    }
}
