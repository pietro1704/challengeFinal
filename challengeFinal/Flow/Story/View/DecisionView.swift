//
//  DecisionView.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 22/10/20.
//

import UIKit

public protocol DecisionViewDelegate: class{
}
public class DecisionView: UIView {
    
    private lazy var stackview: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.axis = .vertical
        addSubview(stack)
        return stack
    }()
    
    fileprivate func setupConstraints() {
        stackview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        stackview.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    private func configureDecisions(_ decisions: [StoryNode]?) {
        guard let decisions = decisions else { return }

        for i in 0..<decisions.count {
            let node = decisions[i]
            let button = PrimaryButton(title: String(node.title ?? ""))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = i
//            button.delegate = self
            stackview.addArrangedSubview(button)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
