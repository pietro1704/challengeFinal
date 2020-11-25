//
//  ChoiceCoordinator.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import UIKit

public class ChoiceCoordinator: Coordinator {
    
    var parentCoordinator: StoryCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var infos: ChoiceViewInfos
    var viewController: ChoiceViewController!
    var eventLogger: LogEventProtocol

    init (navigationController: UINavigationController, infos: ChoiceViewInfos,
          eventLogger: LogEventProtocol) {
        self.navigationController = navigationController
        self.infos = infos
        self.eventLogger = eventLogger
    }

    func start() {
        viewController = ChoiceViewController.instantiate(storyBoardName: "Choice")
        let viewModel = ChoiceViewModel(infos: infos, coordinatorDelegate: self, eventLogger: eventLogger)
        viewController?.viewModel = viewModel
        viewController?.update(with: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }

    func update(infos: ChoiceViewInfos) {
        self.infos = infos
        let viewModel = ChoiceViewModel(infos: infos, coordinatorDelegate: self, eventLogger: eventLogger)
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
        navigationController.popToViewController(parentCoordinator!.viewController,
                                                 animated: true)
    }
    
    public func userWantToConfirmChoice(storyNode: StoryNode) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: .easeOut)
        transition.type = CATransitionType.fade
        navigationController.view.layer.add(transition, forKey: nil)
        _ = navigationController.popToViewController(parentCoordinator!.viewController, animated: false)

        parentCoordinator?.userDidChoosed(storyNode, coordinator: self)
    }
    
    public func userWantToChooseDynamic(dynamic: DynamicTypes) {
        let infosToUpdate = ChoiceViewInfosObject(nodes: infos.nodes,
                                          selectedDynamic: dynamic,
                                          dynamicButtons: infos.dynamicButtons,
                                          selectedNode: nil,
                                          highlightedNode: nil,
                                          nodeToEndAnimation: nil)
        self.update(infos: infosToUpdate)
    }

    public func userWantToChooseNode(node: NodeID) {
        let storyNode = infos.nodes.filter { (storyNode) -> Bool in
            return storyNode.id == node
        }
        
        let infosToUpdate = ChoiceViewInfosObject(nodes: infos.nodes,
                                                  selectedDynamic: infos.selectedDynamic,
                                                  dynamicButtons: infos.dynamicButtons,
                                                  selectedNode: storyNode.first,
                                                  highlightedNode: nil,
                                                  nodeToEndAnimation: infos.nodeToEndAnimation)
        self.update(infos: infosToUpdate)
    }

    public func userGotRandom(node: StoryNode) {
        let infosToUpdate = ChoiceViewInfosObject(nodes: infos.nodes,
                                                  selectedDynamic: infos.selectedDynamic,
                                                  dynamicButtons: infos.dynamicButtons,
                                                  selectedNode: infos.selectedNode,
                                                  highlightedNode: node.id,
                                                  nodeToEndAnimation: node)
        self.update(infos: infosToUpdate)
    }

    public func userWantToHighlightNode(node: StoryNode) {
        let infosToUpdate = ChoiceViewInfosObject(nodes: infos.nodes,
                                                  selectedDynamic: infos.selectedDynamic,
                                                  dynamicButtons: infos.dynamicButtons,
                                                  selectedNode: infos.selectedNode,
                                                  highlightedNode: node.id,
                                                  nodeToEndAnimation: node)
        self.update(infos: infosToUpdate)
    }

    public func userWantToPause() {
        print("user want to pause")
    }
}
