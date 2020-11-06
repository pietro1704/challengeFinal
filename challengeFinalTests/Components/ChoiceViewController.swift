//
//  ChoiceViewController.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import UIKit

class ChoiceViewController: UIViewController, Storyboarded {
    weak var coordinator: ChoiceCoordinator?

    var containerView: ChoiceViewContainer = {
        let chapterView = ChoiceViewContainer()
        chapterView.translatesAutoresizingMaskIntoConstraints = false
        return chapterView
    }()

    var viewModel: ChoiceViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        containerView.viewModel = viewModel
        containerView.configure(using: viewModel)
        view.addSubview(containerView)
        setupConstraints()
    }

    public func update(with viewModel: ChoiceViewModel) {
        self.viewModel = viewModel
        containerView.viewModel = viewModel
        containerView.configure(using: viewModel)
        viewModel.hudDelegate = containerView
        viewModel.updateHUD()
    }

    private func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
