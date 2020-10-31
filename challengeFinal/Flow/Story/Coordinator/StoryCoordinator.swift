//
//  StoryCoordinator.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public class StoryCoordinator: Coordinator {
    
    var parentCoordinator: ChapterCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var storyNode: StoryNode
    var viewController: StoryViewController!

    init (navigationController: UINavigationController, storyNode: StoryNode) {
        self.navigationController = navigationController
        self.storyNode = storyNode
    }

    func start() {
        viewController = StoryViewController.instantiate(storyBoardName: "Story")
        let viewModel = StoryViewModel(node: storyNode, coordinatorDelegate: self)
        viewController?.viewModel = viewModel
        
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = .push
        transition.subtype = .fromTop
        parentCoordinator?.viewController?.view.window!.layer.add(transition, forKey: kCATransition)
        navigationController.pushViewController(viewController, animated: false)
    }

    func update(storyNode: StoryNode) {
        let playerService = PlayerService()
        let viewModel = StoryViewModel(node: storyNode,
                                       coordinatorDelegate: self,
                                       playerService: playerService)
        self.storyNode = viewModel.node!
        viewController?.update(with: viewModel)
    }

    func showChoices(with childNodes: [StoryNode]) {
        let coordinator = ChoiceCoordinator(navigationController: navigationController,
                                            infos: ChoiceViewInfosObject(nodes: childNodes,
                                                                         selectedDynamic: .choice,
                                                                         selectedNode: nil,
                                                                         highlightedNode: nil))
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func userDidChoosed(_ storyNode: StoryNode, coordinator: ChoiceCoordinator) {
        childDidFinished(coordinator)
        self.update(storyNode: storyNode)
    }

    func userWantToDismissChoices(_ coordinator: ChoiceCoordinator) {
        childDidFinished(coordinator)
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

extension StoryCoordinator: StoryViewModelDelegate {
    public func userWantToChoose() {
        showChoices(with: self.storyNode.childNodes)
    }
}
