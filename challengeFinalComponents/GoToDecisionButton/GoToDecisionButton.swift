//
//  GoToDecisionButton.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 28/10/20.
//

import Foundation
import UIKit

class GoToDecisionButton: UIButton{
    

    public init(title: String = "Tente por você mesmo", for state: UIControl.State = .normal) {
        super.init(frame: .zero)
        setTitle(title, for: state)
        setupButton()
        //addTarget(self, action: #selector(handleTap), for: .touchUpInside)
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
