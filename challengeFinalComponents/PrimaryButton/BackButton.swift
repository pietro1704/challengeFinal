//
//  BackButton.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 22/10/20.
//

import UIKit

public protocol BackButtonDelegate: class {
    func buttonPressed(_ tag: Int)
}

class BackButton: UIButton {
    public weak var delegate: BackButtonDelegate?
    
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
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


