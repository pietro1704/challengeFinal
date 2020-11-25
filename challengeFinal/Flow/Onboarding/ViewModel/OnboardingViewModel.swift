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
Bem-vindo(a) a Arajá!

Sou guia de nossa humilde vila, ou era... já nem sei mais. Bem, vou te passar algumas dicas importantes para visitar nosso território pela primeira vez.

Aqui, seus caminhos são limitados por alguns... pontos de decisão. Aparentemente você tem 11. INCRÍVEL, você é uma pessoa de sorte, sabia?

Vou te contar meus segredos para utilizar esses pontos, do jeito que minha avozinha me ensinou:

• Escolhas são caras, viu? E como são caras! Cada escolha, um pontinho se vai.
• Apostar é divertido, você deveria tentar. Escolha o caminho e faça sua aposta. Se acertar, ganha 2 pontos, se errar, perde 1. Afinal, a vida não passa de um jogo, não é mesmo?
• O último truque é meu favorito: a aleatoriedade. Você não gasta nenhum ponto, e deixa o acaso decidir seu destino. É o segredo para viver sem amarras!

Mais uma coisa: tome muito cuidado. Caso seus pontos acabem, pode terminar como eu... aproveitando a vida ao máximo e em toda sua plenitude. Abençoado por não ter limites. Aliás, vou ali fazer umas flexões. Até mais. Ou não.
"""

    public init(coordinatorDelegate: OnboardingViewModelCoordinatorDelegate? = nil) {
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func didTapShowChapter() {
        playerService.finishedOnboarding()
        coordinatorDelegate?.showChapter()
    }
}
