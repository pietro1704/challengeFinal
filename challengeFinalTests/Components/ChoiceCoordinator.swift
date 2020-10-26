//
//  ChoiceCoordinator.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import UIKit

public class ChoiceCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var infos: ChoiceViewInfos
    var viewController: ChoiceViewController?
    
    init (navigationController: UINavigationController, infos: ChoiceViewInfos) {
        self.navigationController = navigationController
        self.infos = infos
    }
    
    func start() {
        viewController = ChoiceViewController.instantiate(storyBoardName: "Choice")
        let viewModel = ChoiceViewModel(infos: infos, coordinatorDelegate: self)
        viewController?.viewModel = viewModel
        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: false)
        }
    }

    func update(infos: ChoiceViewInfos) {
        self.infos = infos
        let viewModel = ChoiceViewModel(infos: infos, coordinatorDelegate: self)
        viewController?.update(with: viewModel)
    }

    func childDidFinished(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}


extension ChoiceCoordinator: ChoiceViewModelDelegate {
    public func userWantToDismiss() {
        print("user want to dismiss")
    }
    
    public func userWantToConfirmChoice() {
        print("user want to confirm")
    }
    
    public func userWantToChooseRandom() {
        print("user want to random")
    }
    
    public func userWantToBet() {
        print("user want to bet")
    }
    
    public func userWantToPause() {
        print("user want to pause")
    }
    

}
