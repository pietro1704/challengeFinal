//
//  OnboardingCoordinator.swift
//  challengeFinal
//
//  Created by Guilherme Tavares Shimamoto on 24/11/20.
//

import UIKit

public class OnboardingCoordinator: Coordinator {
    var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var viewController: OnboardingViewController!

    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        viewController = OnboardingViewController.instantiate(storyBoardName: "Onboarding")
        
        let viewModel = OnboardingViewModel(coordinatorDelegate: self)
        viewController?.viewModel = viewModel
        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: false)
        }
    }
    
    func childDidFinished(_ child: Coordinator?) {
    }
}

extension OnboardingCoordinator: OnboardingViewModelCoordinatorDelegate {
    public func showChapter() {
        parentCoordinator?.userWantToStartChapter(child: self)
    }
}
