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
    
    public func userWantToConfirmChoice(storyNode: StoryNode) {
        let nextCoordinator = StoryCoordinator(navigationController: navigationController,
                                               storyNode: storyNode)
        nextCoordinator.start()
    }
    
    public func userWantToChooseDynamic(dynamic: DynamicTypes) {
        let infosToUpdate = ChoiceViewInfosObject(nodes: infos.nodes,
                                          selectedDynamic: dynamic,
                                          selectedNode: nil,
                                          highlightedNode: nil)
        self.update(infos: infosToUpdate)
    }

    public func userWantToChooseNode(node: NodeID) {
        let storyNode = infos.nodes.filter { (storyNode) -> Bool in
            return storyNode.id == node
        }
        
        let infosToUpdate = ChoiceViewInfosObject(nodes: infos.nodes,
                                                  selectedDynamic: infos.selectedDynamic,
                                                  selectedNode: storyNode.first,
                                                  highlightedNode: nil)
        self.update(infos: infosToUpdate)
    }

    public func userGotRandom(node: NodeID) {
        let infosToUpdate = ChoiceViewInfosObject(nodes: infos.nodes,
                                                  selectedDynamic: infos.selectedDynamic,
                                                  selectedNode: infos.selectedNode,
                                                  highlightedNode: node)
        self.update(infos: infosToUpdate)
    }

    public func userWantToHighlightNode(node: NodeID) {
        let infosToUpdate = ChoiceViewInfosObject(nodes: infos.nodes,
                                                  selectedDynamic: infos.selectedDynamic,
                                                  selectedNode: infos.selectedNode,
                                                  highlightedNode: node)
        self.update(infos: infosToUpdate)
    }

    public func userWantToPause() {
        print("user want to pause")
    }
}
