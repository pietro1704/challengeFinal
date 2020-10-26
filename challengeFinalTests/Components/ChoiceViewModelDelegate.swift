//
//  ChoiceViewModelDelegate.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import Foundation

public protocol ChoiceViewModelDelegate: class {

    func userWantToDismiss()
    func userWantToConfirmChoice()
    func userWantToChooseRandom()
    func userWantToBet()
    func userWantToPause()
}
