//
//  OnboardingViewModel.swift
//  challengeFinal
//
//  Created by Guilherme Tavares Shimamoto on 24/11/20.
//

import Foundation

public class OnboardingViewModel {
    var coordinatorDelegate: OnboardingViewModelCoordinatorDelegate?
    var playerService: PlayerServiceProtocol = PlayerService()
    var imagePath: String = "00_menu"
    var text = """
Bem-vindo a Arajá!
Sou guia de nossa humilde vila, ou era... Já nem sei mais. Bem, vou te passar algumas dicas importantes para visitar nosso território pela primeira vez.

Aqui seus caminhos são limitados por alguns... Pontos de decisão. Aparentemente você tem 11? INCRÍVEL, você é um homem de sorte sabia?

Vou te contar meus segredos para utilizar esses pontos, do jeito que minha vózinha me ensinou:

- Escolhas são caras, rapaz e como são caras! Cada escolha um pontinho se vai.
- Apostar é divertido, você deveria tentar... Nada melhor do que o receber 2 pontos de decisão pelo preço de 1.
- O último truque é meu favorito, o acaso. Não gastar nada, para viver sem amarras.

Mais uma coisa, tome muito cuidado meu rapaz, caso seus pontos acabem, pode terminar como eu... Aproveitando a vida ao máximo e em sua maior plenitude. Abençoado para não ter limites. Aliás, vou ali fazer umas flexões. Até mais. Ou não.
"""

    public init(coordinatorDelegate: OnboardingViewModelCoordinatorDelegate? = nil) {
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func didTapShowChapter() {
        playerService.finishedOnboarding()
        coordinatorDelegate?.showChapter()
    }
}
