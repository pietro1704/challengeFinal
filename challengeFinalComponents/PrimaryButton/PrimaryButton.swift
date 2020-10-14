//
//  PrimaryButton.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public class PrimaryButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupButton()
    }

    public init(title: String, for state: UIControl.State = .normal) {
        super.init(frame: .zero)
        setupButton()
        setTitle(title, for: state)
    }

    private func setupButton() {
        self.backgroundColor = .red
        self.tintColor = .green
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
