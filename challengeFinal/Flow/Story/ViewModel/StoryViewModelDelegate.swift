//
//  StoryViewModelDelegate.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 21/10/20.
//

import Foundation

public protocol StoryViewModelDelegate: class {
    
    func userChoosedNode(_ node: StoryNode)
}
