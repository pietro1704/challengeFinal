//
//  ChoiceButton.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 23/10/20.
//

import UIKit

public protocol ChoiceButtonDelegate: class {
    func choiceButtonPressed(_ choiceId: NodeID)
}

private let roundViewWidth: CGFloat = 22.0
private let imageforHighlightIndicator: UIImage? = UIImage(systemName: "arrow.right")
public class ChoiceButton: UIView {

    weak var delegate: ChoiceButtonDelegate?
    public var nodeId: NodeID = 0

    lazy var primaryButton: PrimaryButton = {
        let button = PrimaryButton()
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        button.addGestureRecognizer(gesture)
        return button
    }()

    @objc func handleTap() {
        self.delegate?.choiceButtonPressed(nodeId)
    }

    lazy var highlightIndicator: UIImageView = {
        let imageView = UIImageView()
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 31).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.isHidden = true
        if let image = imageforHighlightIndicator {
            imageView.image = image
        }
        return imageView
    }()

    lazy var selectedIndicator: UIView = {
        let roundView = UIView()
        addSubview(roundView)
        roundView.translatesAutoresizingMaskIntoConstraints = false
        roundView.widthAnchor.constraint(equalToConstant: roundViewWidth).isActive = true
        roundView.heightAnchor.constraint(equalTo: roundView.widthAnchor).isActive = true
        roundView.layer.cornerRadius = roundViewWidth / 2
        roundView.isHidden = true
        return roundView
    }()

    private var isHighlighted: Bool {
        didSet {
            changeHighligt()
        }
    }

    private var isSelected: Bool {
        didSet {
            changeSelection()
        }
    }

    public init(buttonText: String, isHighlighted: Bool = false, isSelected: Bool = false,
                colorName: String) {
        self.isHighlighted = isHighlighted
        self.isSelected = isSelected
        super.init(frame: .zero)
        primaryButton.update(title: buttonText)
        setupConstraints()
        setupView(with: colorName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(with colorName: String) {
        if let color = UIColor(named: colorName) {
            self.highlightIndicator.tintColor = color
            self.selectedIndicator.backgroundColor = color
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            primaryButton.topAnchor.constraint(equalTo: topAnchor),
            primaryButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            primaryButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            primaryButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            highlightIndicator.centerYAnchor.constraint(equalTo: primaryButton.centerYAnchor),
            highlightIndicator.trailingAnchor.constraint(equalTo: primaryButton.leadingAnchor),
            selectedIndicator.centerYAnchor.constraint(equalTo: primaryButton.topAnchor),
            selectedIndicator.centerXAnchor.constraint(equalTo: primaryButton.trailingAnchor)
        ])
    }

    public func update(isHighlighted: Bool?, isSelected: Bool?) {
        if let isHighlighted = isHighlighted {
            self.isHighlighted = isHighlighted
        }

        if let isSelected = isSelected {
            self.isSelected = isSelected
        }
    }

    private func changeHighligt() {
        self.highlightIndicator.isHidden = !isHighlighted
    }

    private func changeSelection() {
        self.selectedIndicator.isHidden = !isSelected
    }
}
