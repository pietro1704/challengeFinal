//
//  StoryCoordinator+StoryViewModelDelegate.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 21/10/20.
//

import Foundation

extension StoryCoordinator: StoryViewModelDelegate {
    public func userChoosedNode(_ node: StoryNode) {
        // verificar se o node é inicio de capitulo ou não
        // se for, instanciar o ChapterCoordinator
        // se não for, atualizar nó
        self.update(storyNode: node)
    }
}
