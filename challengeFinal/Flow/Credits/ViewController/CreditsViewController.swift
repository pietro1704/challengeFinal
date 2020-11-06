//
//  ViewController.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import UIKit

class CreditsViewController: UIViewController, Storyboarded {

    weak var coordinator: CreditsCoordinator?

    var containerView: CreditsViewContainer = {
        let containerView = CreditsViewContainer()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()

    var viewModel: CreditsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        containerView.viewModel = viewModel
        containerView.setup(with: viewModel)
        view.addSubview(containerView)
        setupConstraints()
    }

    public func update(with viewModel: CreditsViewModel) {
        self.viewModel = viewModel
        containerView.viewModel = viewModel
    }

    private func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
