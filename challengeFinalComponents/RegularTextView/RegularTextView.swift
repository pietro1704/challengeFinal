//
//  RegularTextView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public class RegularTextView: UIView {

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        addSubview(label)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .justified
        return label
    }()

    public init() {
        super.init(frame: .zero)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with infos: RegularTextViewInfos) {
        self.textLabel.text = infos.text
    }

    public func configure(with text: String) {
        self.textLabel.text = text
    }
}
