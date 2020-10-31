//
//  ChoiceView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import UIKit

public protocol ChoiceViewDelegate: class {
    func choiceButtonPressed(node: NodeID)
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
        stackview.spacing = 24
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
        button.layer.cornerRadius = 5
        button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(confirmButtonPressed))
        button.addGestureRecognizer(gesture)
        return button
    }()

    lazy var hudView: HUDView = {
        let hud = HUDView()
        addSubview(hud)
        hud.translatesAutoresizingMaskIntoConstraints = false
        return hud
    }()

    lazy var backButton: TransparentButton = {
        let button = TransparentButton(title: "Voltar")
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
        prepareForReview()
        setupDynamicButtons(infos.dynamicButtons, selected: infos.selectedDynamic)
        setupChoiceButtons(infos.nodes, selected: infos.selectedNode?.id,
                           canChooseNode: infos.canChooseNode, highlighted: infos.highlightedNode)
        setupView()
    }

    private func prepareForReview() {
        dynamicButtons.arrangedSubviews.forEach { (dynamicButton) in
            dynamicButton.removeFromSuperview()
        }

        choiceButtons.arrangedSubviews.forEach { (choiceButton) in
            choiceButton.removeFromSuperview()
        }
    }

    private func setupDynamicButtons(_ types: [DynamicTypes], selected: DynamicTypes?) {
        for i in 0..<types.count {
            let type = types[i]
            let button = DynamicButton(type: type, isSelected: selected == type)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.delegate = self
            dynamicButtons.addArrangedSubview(button)
        }
    }

    private func setupChoiceButtons(_ nodes: [StoryNode], selected: NodeID?,
                                    canChooseNode: Bool, highlighted: NodeID?) {
        for i in 0..<nodes.count {
            let node = nodes[i]
            let button = ChoiceButton(buttonText: node.title ?? "", colorName: "Red")
            button.update(isHighlighted: highlighted == node.id, isSelected: selected == node.id)
            button.nodeId = node.id
            button.translatesAutoresizingMaskIntoConstraints = false
            button.delegate = self
            button.isUserInteractionEnabled = canChooseNode
            button.alpha = canChooseNode ? 1 : 0.3
            choiceButtons.addArrangedSubview(button)
        }
    }

    private func setupView() {
        let padding: CGFloat = 32.0
        backgroundColor = UIColor(named: "Background")
        NSLayoutConstraint.activate([
            dynamicButtons.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            dynamicButtons.centerXAnchor.constraint(equalTo: centerXAnchor),
            hudView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            hudView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            hudView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            choiceButtons.topAnchor.constraint(equalTo: dynamicButtons.bottomAnchor, constant: padding),
            choiceButtons.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.6),
            choiceButtons.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.8),
            choiceButtons.centerXAnchor.constraint(equalTo: centerXAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            confirmAction.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            confirmAction.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
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
        self.delegate?.choiceButtonPressed(node: choiceId)
    }
}

extension ChoiceView: PauseButtonDelegate {
    public func pauseButtonPressed() {
        self.delegate?.pauseButtonPressed()
    }
}

extension ChoiceView: TransparentButtonDelegate {
    public func transpButtonPressed() {
        self.delegate?.backButtonPressed()
    }
}
