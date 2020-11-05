//
//  MenuView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 05/11/20.
//

import UIKit

public class MenuView: UIView {
    lazy var imageView: ImageView = {
        let image = ImageView()
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.imageView.contentMode = .scaleAspectFit
        return image
    }()

    lazy var containerView: UIView = {
        let view = UIView()
        addSubview(view)
        view.addSubview(logo)
        view.addSubview(buttonStack)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var logo: UIView = {
        let logo = UIView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.heightAnchor.constraint(equalToConstant: 56).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 340).isActive = true
        logo.backgroundColor = .red
        return logo
    }()
    
    lazy var newGameButton: TransparentButton = {
        let button = TransparentButton(title: "Novo jogo")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var continueGameButton: TransparentButton = {
        let button = TransparentButton(title: "Continuar")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [newGameButton, continueGameButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 40
        return stack
    }()

    public init() {
        super.init(frame: .zero)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func update(newGameButtonText: String?, continueGameButtonText: String?) {
        self.newGameButton.setTitle(newGameButtonText, for: .normal)
        self.continueGameButton.setTitle(continueGameButtonText, for: .normal)
    }

    public func received(image: UIImage) {
        imageView.recievedImage(image: image)
    }

    private func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        setupContainerViewConstraints()
    }

    private func setupContainerViewConstraints() {
        logo.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 64).isActive = true
        logo.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        buttonStack.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 40).isActive = true
        buttonStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
}
