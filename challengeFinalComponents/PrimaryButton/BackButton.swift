//
//  BackButton.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 22/10/20.
//

import UIKit

public protocol BackButtonDelegate: class {
    func backButtonPressed()
}

class BackButton: UIButton {
    public weak var delegate: BackButtonDelegate?

    public init(title: String = "Voltar", titleColor:UIColor = .label, for state: UIControl.State = .normal) {
        super.init(frame: .zero)
        setupButton()
        setTitle(title, for: state)
        setTitleColor(titleColor, for: state)
        
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    @objc private func handleTap() {
        self.delegate?.backButtonPressed()
    }
    
    private func setupButton() {
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


