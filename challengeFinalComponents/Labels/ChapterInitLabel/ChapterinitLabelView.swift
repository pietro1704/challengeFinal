//
//  ChapterinitLabelView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 21/10/20.
//

import UIKit

public class ChapterinitLabel: UIView {

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.numberOfLines = 0
        return label
    }()

    lazy var line: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .red
        addSubview(lineView)
//        lineView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        return lineView
    }()

    public init(with text: String) {
        super.init(frame: .zero)
        setupConstraints()
        self.label.text = text
    }

    public func update(with text: String) {
        self.label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.bottomAnchor.constraint(equalTo: line.topAnchor),
            line.topAnchor.constraint(equalTo: label.bottomAnchor),
            line.leadingAnchor.constraint(equalTo: leadingAnchor),
            line.trailingAnchor.constraint(equalTo: trailingAnchor),
            line.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
