//
//  MenuViewContainer.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 05/11/20.
//

import UIKit

public class CreditsViewContainer: UIView {
    
    lazy var creditsView: CreditsView = {
        let view = CreditsView()
        addSubview(view)
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
        creditsView.configure(using: viewModel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            creditsView.topAnchor.constraint(equalTo: topAnchor),
            creditsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            creditsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            creditsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
