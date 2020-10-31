//
//  ChoiceViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import Foundation

public class ChoiceViewModel {

    weak var delegate: ChoiceViewModelDelegate?
    var infos: ChoiceViewInfos?
    let service = StoryNodesServices()
    let playerService: PlayerServiceProtocol

    init(infos: ChoiceViewInfos, coordinatorDelegate: ChoiceViewModelDelegate,
         playerService: PlayerServiceProtocol = PlayerService()) {
        self.infos = infos
        self.delegate = coordinatorDelegate
        self.playerService = playerService
    }

    public func userWantToDismiss() {
        delegate?.userWantToDismiss()
    }

    public func userWantToConfirmChoice() {
        guard let dynamic = infos?.selectedDynamic else { return }
        switch dynamic {
        case .choice:
            userChoosed()
        case .random:
            userChoosedRandom()
        case .bet:
            userChoosedBet()
        }
    }

    private func userChoosed() {
        guard let selectedNode = infos?.selectedNode else { return }
        playerService.decreasePlayerPoints(by: 1)
        delegate?.userWantToConfirmChoice(storyNode: selectedNode)
    }

    private func userChoosedRandom() {
        let randomNode = retrieveRandomNumber()
        print(randomNode)
        delegate?.userWantToHighlightNode(node: randomNode)
        animateAndConfirmChoice(randomNode)
    }

    private func userChoosedBet() {
        guard let selectedNode = infos?.selectedNode else { return }

        let randomNode = retrieveRandomNumber()
        if randomNode == selectedNode.id {
            playerService.decreasePlayerPoints(by: 1)
        } else {
            playerService.increasePlayerPoints(by: 2)
        }

        delegate?.userGotRandom(node: randomNode)
        animateAndConfirmChoice(randomNode)
    }

    private func animateAndConfirmChoice(_ randomNode: NodeID) {
        let node = infos?.nodes.filter({$0.id == randomNode}).first
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.delegate?.userWantToConfirmChoice(storyNode: node!)
        }
    }

    private func retrieveRandomNumber() -> NodeID {
        guard let nodes = infos?.nodes,
              let randomNode = nodes.randomElement() else { return 0 }
        return randomNode.id
    }

    public func userWantToChooseNode(_ nodeID: NodeID) {
        delegate?.userWantToChooseNode(node: nodeID)
    }

    public func userWantToChooseDynamic(_ dynamic: DynamicTypes) {
        delegate?.userWantToChooseDynamic(dynamic: dynamic)
    }

    public func userWantToPause() {
        delegate?.userWantToPause()
    }
}
