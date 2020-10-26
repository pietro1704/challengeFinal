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

    public init(infos: ChoiceViewInfos, coordinatorDelegate: ChoiceViewModelDelegate) {
        self.infos = infos
        self.delegate = coordinatorDelegate
    }

//    public init(with nodeIds: [NodeID]) {
//        self.nodes = service.retrieveNode(nodeId: nodeId)
//    }

    public func userWantToDismiss() {
        delegate?.userWantToDismiss()
    }

    public func userWantToConfirmChoice() {
        delegate?.userWantToConfirmChoice()
    }

    public func userWantToChooseRandom() {
        delegate?.userWantToChooseRandom()
    }

    public func userWantToBet() {
        delegate?.userWantToBet()
    }

    public func userWantToPause() {
        delegate?.userWantToPause()
    }
}
