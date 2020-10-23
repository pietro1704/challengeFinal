//
//  BackButton.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 22/10/20.
//

import UIKit

public protocol PauseButtonDelegate: class {
    func buttonPressed(_ tag: Int)
}

class PauseButton: UIButton {
    public weak var delegate: PauseButtonDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupButton(for: .normal)
    }
    
    public init(for state: UIControl.State = .normal) {
        super.init(frame: .zero)
        setupButton(for: state)
        
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    @objc private func handleTap() {
        self.delegate?.buttonPressed(tag)
    }
    
    private func setupButton(for state: UIControl.State) {
        //transparent background
        self.backgroundColor = .none
        
        if let image = UIImage(systemName: "pause.circle"){
            self.setImage(image, for: state)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


