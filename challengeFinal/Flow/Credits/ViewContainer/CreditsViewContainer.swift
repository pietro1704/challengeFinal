//
//  MenuViewContainer.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 05/11/20.
//

import UIKit

public class CreditsViewContainer: UIView {
    
    lazy var containerView: CreditsView = {
        let view = CreditsView()
        addSubview(view)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var viewModel: CreditsViewModel?

    public init() {
        super.init(frame: .zero)
        setupConstraints()
    }

    public init(viewModel: CreditsViewModel) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        setupConstraints()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(with viewModel: CreditsViewModel?) {
        self.viewModel = viewModel
        setupView()
    }

    private func setupView() {
        guard let viewModel = viewModel else { return }
        if let image = UIImage(named: viewModel.imagePath) {
            containerView.received(image: image)
        }
        containerView.continueGameButton.changeButton(to: viewModel.userCanContinue)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}

extension CreditsViewContainer: CreditsViewModelDelegate {
    public func startNewGame() {
        viewModel?.userWantToStartNewGame()
    }
    
    public func continueGame() {
        viewModel?.userWantToContinueGame()
    }
    
    public func settings() { }
}
