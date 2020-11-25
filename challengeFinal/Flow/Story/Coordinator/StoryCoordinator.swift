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
    let eventLogger: LogEventProtocol
    var playerService: PlayerServiceProtocol?

    init (navigationController: UINavigationController, storyNode: StoryNode,
          eventLogger: LogEventProtocol) {
        self.navigationController = navigationController
        self.storyNode = storyNode
        self.eventLogger = eventLogger
    }

    func start() {
        viewController = StoryViewController.instantiate(storyBoardName: "Story")
        update(storyNode: storyNode)

        let transition = CATransition()
        transition.duration = 0.4
        transition.type = .push
        transition.subtype = .fromTop
        parentCoordinator?.viewController?.view.window!.layer.add(transition, forKey: kCATransition)
        navigationController.pushViewController(viewController, animated: false)
    }

    func update(storyNode: StoryNode) {
        playerService = PlayerService()

        let viewModel = StoryViewModel(node: storyNode,
                                       coordinatorDelegate: self,
                                       playerService: playerService!,
                                       eventLogger: eventLogger)
        self.storyNode = viewModel.node!
        viewController?.viewModel = viewModel
        
        playerService?.saveChoosenNode(id: storyNode.id)

        if !self.storyNode.childNodes.isEmpty {
            viewController?.update(with: viewModel)
        } else {
            viewController?.transformIntoFinalNode(with: viewModel)
        }

    }

    func showChoices(with childNodes: [StoryNode]) {
        var dynamics: [DynamicTypes]
        var selectedDynamic: DynamicTypes
        if playerService?.player.points == 0 {
            dynamics = [.random]
            selectedDynamic = .random
        } else {
            dynamics = [.choice, .bet, .random]
            selectedDynamic = .choice
        }
        let coordinator = ChoiceCoordinator(navigationController: navigationController,
                                            infos: ChoiceViewInfosObject(nodes: childNodes,
                                                                         selectedDynamic: selectedDynamic,
                                                                         dynamicButtons: dynamics,
                                                                         selectedNode: nil,
                                                                         highlightedNode: nil,
                                                                         nodeToEndAnimation: nil),
                                            eventLogger: eventLogger)
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

    func finishCurrentStory() {
        parentCoordinator?.showCredits(child: self)

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

    public func userDidFinishChapter() {
        finishCurrentStory()
    }

}
