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

    public func userWantToDismiss() {
        delegate?.userWantToDismiss()
    }

    public func userWantToConfirmChoice() {
        delegate?.userWantToConfirmChoice()
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
        delegate?.userWantToChooseRandom()
    }

    public func userWantToPause() {
        delegate?.userWantToPause()
    }
}
