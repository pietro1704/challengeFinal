//
//  OnboardingViewController.swift
//  challengeFinal
//
//  Created by Guilherme Tavares Shimamoto on 24/11/20.
//

import UIKit

class OnboardingViewController: UIViewController, Storyboarded {
    weak var coordinator: OnboardingCoordinator?
    var viewModel: OnboardingViewModel?
    
    var containerView: OnboardingView = {
        let onboardingView = OnboardingView()
        onboardingView.translatesAutoresizingMaskIntoConstraints = false
        return onboardingView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        containerView.viewModel = viewModel
        containerView.configure(using: viewModel)
        view.addSubview(containerView)
        setupConstraints()
    }

    private func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
