//
//  StoryViewController.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

class StoryViewController: UIViewController, Storyboarded {
    weak var coordinator: StoryCoordinator?

    var containerView: StoryView = {
        let storyView = StoryView()
        storyView.translatesAutoresizingMaskIntoConstraints = false
        return storyView
    }()

    var viewModel: StoryViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        containerView.viewModel = viewModel
        containerView.configure(using: viewModel)
        containerView.delegate = self
        view.addSubview(containerView)
        setupConstraints()
    }

    public func update(with viewModel: StoryViewModel) {
        self.viewModel = viewModel
        containerView.viewModel = viewModel
        containerView.configure(using: viewModel)
    }

    private func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}

extension StoryViewController: StoryViewDelegate {
    func userChoose(nodeId: NodeID) {
        let nodeViewModel = StoryViewModel(with: nodeId)
        self.containerView.configure(using: nodeViewModel)
    }
}
