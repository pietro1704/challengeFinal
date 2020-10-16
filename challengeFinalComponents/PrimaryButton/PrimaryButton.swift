//
//  PrimaryButton.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public protocol PrimaryButtonDelegate: class {
    func buttonPressed(_ tag: Int)
}

public class PrimaryButton: UIButton {
    
    public weak var delegate: PrimaryButtonDelegate?

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupButton()
    }

    public init(title: String, for state: UIControl.State = .normal) {
        super.init(frame: .zero)
        setupButton()
        setTitle(title, for: state)
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }

    @objc private func handleTap() {
        self.delegate?.buttonPressed(tag)
    }

    private func setupButton() {
        self.backgroundColor = .red
        self.tintColor = .green
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
