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
    func animationFinished()
}

public class ChoiceView: UIView {

    weak var delegate: ChoiceViewDelegate?
    var infos: ChoiceViewInfos?

    var lastAnimatedIndex: Int = 0
    var currentAnimation: Int = 0
    var maxAnimation: Int = 5
    let stdDuration: Double = 0.2
    var currentDuration: Double = 0.2
    var choiceButtonTapped: ChoiceButton?
    
    lazy var dynamicButtons: UIStackView = {
        let stackview = UIStackView()
        addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 48
        stackview.distribution = .equalSpacing
        stackview.backgroundColor = backgroundColor
        return stackview
    }()

    lazy var dynamicButtonsBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.backgroundColor = backgroundColor

        view.addSubview(dynamicButtons)
        NSLayoutConstraint.activate([
            dynamicButtons.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            dynamicButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dynamicButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dynamicButtons.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }()

    lazy var choiceButtons: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 8
        stackview.distribution = .fillProportionally
        return stackview
    }()

    lazy var buttonsScroll: UIScrollView = {
        let innerView = UIView()
        innerView.addSubview(choiceButtons)
        innerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            choiceButtons.topAnchor.constraint(equalTo: innerView.topAnchor),
            choiceButtons.leadingAnchor.constraint(equalTo: innerView.leadingAnchor),
            choiceButtons.trailingAnchor.constraint(equalTo: innerView.trailingAnchor),
            choiceButtons.bottomAnchor.constraint(equalTo: innerView.bottomAnchor)
        ])

        let scroll = UIScrollView()
        addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.clipsToBounds = false
        scroll.showsVerticalScrollIndicator = false
        scroll.addSubview(innerView)
        
        NSLayoutConstraint.activate([
            innerView.topAnchor.constraint(equalTo: scroll.topAnchor),
            innerView.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            innerView.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            innerView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor)
        ])
        
        self.sendSubviewToBack(scroll)
        
        return scroll
    }()
    
    lazy var confirmAction: UIButton = {
        let button = UIButton()
        button.setTitle("Confirmar", for: .normal)
        
        // Dynamic type
        guard let titleLabel = button.titleLabel else { return UIButton() }
        titleLabel.font = UIFont.heptaBold()
        titleLabel.adjustsFontForContentSizeCategory = true
        
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
        self.infos = infos
        prepareForReview()
        setupDynamicButtons(infos.dynamicButtons, selected: infos.selectedDynamic)
        setupChoiceButtons(infos.nodes,
                           selected: infos.selectedNode?.id,
                           canChooseNode: infos.canChooseNode)
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

    private func setupChoiceButtons(_ nodes: [StoryNode],
                                    selected: NodeID?,
                                    canChooseNode: Bool) {
        for i in 0..<nodes.count {
            let node = nodes[i]
            let button = ChoiceButton(buttonText: node.title ?? "", colorName: "Red")
            button.update(isSelected: selected == node.id)
            button.nodeId = node.id
            button.translatesAutoresizingMaskIntoConstraints = false
            button.delegate = self
            button.isUserInteractionEnabled = canChooseNode
            button.primaryButton.alpha = canChooseNode ? 1 : 0.3
            choiceButtons.addArrangedSubview(button)
        }
    }

    private func setupView() {
        let padding: CGFloat = 32.0
        backgroundColor = .background
        NSLayoutConstraint.activate([
            dynamicButtonsBackground.topAnchor.constraint(equalTo: topAnchor),
            dynamicButtonsBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            hudView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            hudView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            hudView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            buttonsScroll.topAnchor.constraint(equalTo: dynamicButtonsBackground.bottomAnchor, constant: padding),
            buttonsScroll.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonsScroll.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            buttonsScroll.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
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
