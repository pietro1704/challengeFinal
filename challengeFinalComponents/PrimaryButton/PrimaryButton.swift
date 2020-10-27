//
//  PrimaryButton.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public protocol PrimaryButtonDelegate: class {
    func primaryButtonPressed(_ tag: Int)
}

public class PrimaryButton: UIButton {
    
    public weak var delegate: PrimaryButtonDelegate?

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupButton()
    }

    public init(title: String, for state: UIControl.State = .normal) {
        super.init(frame: .zero)
        setTitle(title, for: state)
        setupButton()
    }

    public func update(title: String, for state: UIControl.State = .normal) {
        setTitle(title, for: state)
    }

    private func setupButton() {
        contentEdgeInsets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        layer.cornerRadius = 4
        if let color = UIColor(named: "ButtonBackground") {
            backgroundColor = color
        }
        setTitleColor(.black, for: .normal)
        setupButtonText()
    }

    private func setupButtonText() {
        guard let titleLabel = self.titleLabel else { return }

        titleLabel.font = UIFont.preferredFont(for: .headline, weight: .bold)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
