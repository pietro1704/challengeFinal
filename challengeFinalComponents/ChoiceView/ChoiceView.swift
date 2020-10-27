//
//  ChoiceView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import UIKit

public protocol ChoiceViewDelegate: class {
    func choiceButtonPressed(choice: NodeID)
    func dynamicButtonPressed(dynamic: DynamicTypes)
    func backButtonPressed()
    func confirmButtonPressed()
    func pauseButtonPressed()
}

public class ChoiceView: UIView {

    weak var delegate: ChoiceViewDelegate?

    lazy var dynamicButtons: UIStackView = {
        let stackview = UIStackView()
        addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 8
        stackview.distribution = .equalSpacing
        return stackview
    }()

    lazy var choiceButtons: UIStackView = {
        let stackview = UIStackView()
        addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 8
        stackview.distribution = .fillProportionally
        return stackview
    }()
    
    lazy var confirmAction: UIButton = {
        let button = UIButton()
        button.setTitle("Confirmar", for: .normal)
        button.backgroundColor = UIColor(named: "Red")
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(confirmButtonPressed))
        button.addGestureRecognizer(gesture)
        return button
    }()

    lazy var pauseButton: PauseButton = {
        let button = PauseButton()
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.delegate = self
        return button
    }()

    lazy var backButton: BackButton = {
        let button = BackButton()
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.delegate = self
        return button
    }()

    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func update(with infos: ChoiceViewInfos) {
        setupDynamicButtons(infos.dynamicButtons)
        setupChoiceButtons(infos.nodes)
        setupView()
    }

    private func setupDynamicButtons(_ types: [DynamicTypes]) {
        for i in 0..<types.count {
            let type = types[i]
            let button = DynamicButton(type: type)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.delegate = self
            dynamicButtons.addArrangedSubview(button)
        }
    }

    private func setupChoiceButtons(_ nodes: [StoryNode]) {
        for i in 0..<nodes.count {
            let node = nodes[i]
            let button = ChoiceButton(buttonText: node.title ?? "", colorName: "Red")
            button.translatesAutoresizingMaskIntoConstraints = false
            button.delegate = self
            choiceButtons.addArrangedSubview(button)
        }
    }

    private func setupView() {
        backgroundColor = UIColor(named: "Background")
        NSLayoutConstraint.activate([
            dynamicButtons.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            dynamicButtons.centerXAnchor.constraint(equalTo: centerXAnchor),
            pauseButton.topAnchor.constraint(equalTo: topAnchor),
            pauseButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            pauseButton.heightAnchor.constraint(equalToConstant: 40),
            pauseButton.widthAnchor.constraint(equalTo: pauseButton.heightAnchor),
            choiceButtons.topAnchor.constraint(equalTo: dynamicButtons.bottomAnchor, constant: 32),
            choiceButtons.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.6),
            choiceButtons.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.8),
            choiceButtons.centerXAnchor.constraint(equalTo: centerXAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            confirmAction.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            confirmAction.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ])
    }

    @objc func confirmButtonPressed() {
        self.delegate?.confirmButtonPressed()
    }

    public override func didMoveToSuperview() {
        setupConstraints()
    }

    private func setupConstraints() {
        guard let superview = superview else { return }
        self.widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: superview.heightAnchor).isActive = true
    }
}

extension ChoiceView: DynamicButtonDelegate {
    public func buttonPressed(_ type: DynamicTypes) {
        self.delegate?.dynamicButtonPressed(dynamic: type)
    }
}

extension ChoiceView: ChoiceButtonDelegate {
    public func choiceButtonPressed(_ choiceId: NodeID) {
        self.delegate?.choiceButtonPressed(choice: choiceId)
    }
}

extension ChoiceView: PauseButtonDelegate {
    public func pauseButtonPressed() {
        self.delegate?.pauseButtonPressed()
    }
}

extension ChoiceView: BackButtonDelegate {
    public func backButtonPressed() {
        self.delegate?.backButtonPressed()
    }
}
