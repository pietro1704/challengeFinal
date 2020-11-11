//
//  ChoiceViewModelDelegate.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import Foundation

/// NavegationDelegate
public protocol ChoiceViewModelDelegate: class {

    func userWantToDismiss()
    func userWantToConfirmChoice(storyNode: StoryNode)
    func userWantToChooseDynamic(dynamic: DynamicTypes)
    func userWantToHighlightNode(node: StoryNode)
    func userWantToChooseNode(node: NodeID)
    func userGotRandom(node: StoryNode)
    func userWantToPause()
}
