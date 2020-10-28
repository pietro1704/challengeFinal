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

    public init(infos: ChoiceViewInfos, coordinatorDelegate: ChoiceViewModelDelegate,
                playerService: PlayerServiceProtocol) {
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
        delegate?.userWantToConfirmChoice(storyNode: selectedNode)
    }

    private func userChoosedRandom() {
        let randomNode = retrieveRandomNumber()
        print(randomNode)
        delegate?.userWantToHighlightNode(node: randomNode)
    }

    private func userChoosedBet() {
        guard let selectedNode = infos?.selectedNode else { return }
        
        let randomNode = retrieveRandomNumber()
        if randomNode == selectedNode.id {
            print("gain")
        } else {
            print("loss")
        }

        delegate?.userGotRandom(node: randomNode)
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
        switch dynamic {
        case .bet:
            print("user want to bet")
        case .choice:
            print("user want to choose")
        case .random:
            print("user want to random")
        }
        delegate?.userWantToChooseDynamic(dynamic: dynamic)
    }

    public func userWantToPause() {
        delegate?.userWantToPause()
    }
}
