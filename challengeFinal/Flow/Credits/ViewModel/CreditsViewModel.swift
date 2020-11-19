//
//  MenuViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 05/11/20.
//

import UIKit

public protocol CreditsViewModelDelegate: class {
    func userWantToStartNewGame()
    func userWantToGoToMenu()
}

public class CreditsViewModel {
    
    weak var delegate: CreditsViewModelDelegate?
    var imagePath: String = "04_pega-o-fosforo_isso-ja-e-demais"
    let storyService = StoryNodesServices()
    let playerService: PlayerServiceProtocol
    var userCanContinue: Bool
    var text = """
    Game Design
    César Ganimi Machado
    Guilherme Luis
    Guilherme Shimamoto
    Ivo Gimenes Dutra
    Pietro Pugliesi

    Game Art
    César Ganimi Machado
    Guilherme Shimamoto

    Development
    Guilherme Luis
    Guilherme Shimamoto
    Ivo Gimenes Dutra
    Pietro Pugliesi

    Roteiro
    César Ganimi Machado
    Guilherme Luis
    Guilherme Shimamoto
    Ivo Gimenes Dutra
    Pietro Pugliesi

    Escrita
    César Ganimi
    Guilherme Shimamoto
    Ivo Gimenes Dutra

    Mídias
    Edited "Group of young girls dancing around a maypole" by simpleinsomnia is licensed under CC BY 2.0
    Edited "DFFD House Burn, Dec 2009" by JimAnderson1972 is licensed under CC BY 2.0

    Agradecimento Especiais
    Sergio Ordine
    Gustavo Lima
    Mapi e Djama
    Todos que ajudaram no desenvolvimento
    e você.
"""
    
    var boldText: [String] = [
        "Game Design",
        "Game Art",
        "Development",
        "Roteiro",
        "Escrita",
        "Mídias",
        "Agradecimento Especiais"
    ]
    
    public init(coordinatorDelegate: CreditsViewModelDelegate, playerService: PlayerServiceProtocol) {
        self.delegate = coordinatorDelegate
        self.playerService = playerService
        self.userCanContinue = playerService.getLastNode() != nil
    }

    public func userWantToStartNewGame() {
        delegate?.userWantToStartNewGame()
    }
    
    public func userWantToGoToMenu() {
        delegate?.userWantToGoToMenu()
    }
}
