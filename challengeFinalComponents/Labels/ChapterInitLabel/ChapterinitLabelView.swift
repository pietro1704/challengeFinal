//
//  ChapterinitLabelView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 21/10/20.
//

import UIKit

public class ChapterInitLabel: UIView {

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.numberOfLines = 0
        return label
    }()

    lazy var line: UIView = {
        let lineView = UIView()
        addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return lineView
    }()

    public init(with text: String, colorName: String = "Red") {
        super.init(frame: .zero)
        setupConstraints()
        self.label.text = text
        setSeparatorColor(with: colorName)
    }

    public func update(with text: String, colorName: String = "Red") {
        self.label.text = text
        setSeparatorColor(with: colorName)
    }
    
    private func setSeparatorColor(with colorName: String) {
        if let color = UIColor(named: colorName) {
            line.backgroundColor = color
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: line.topAnchor),
            line.topAnchor.constraint(equalTo: label.bottomAnchor),
            line.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            line.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
