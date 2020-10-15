//
//  StoryViewController.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

class StoryViewController: UIViewController, Storyboarded {
    weak var coordinator: StoryCoordinator?
    var storyView: StoryView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true

        storyView = StoryView(with: Infos.mockInfos())
        storyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(storyView)
        storyView.configure(using: Infos.mockInfos())
        storyView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        storyView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        storyView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        storyView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}

private struct Infos {

    private struct TextInfos: RegularTextViewInfos {
        var text: String
        static func mockText() -> RegularTextViewInfos {
            return TextInfos(text: "Até então você tinha pleno controle sobre seus atos. Por mais que o acaso interferisse no mundo, o livre-arbítrio era uma realidade inexorável: você podia tomar a atitude que bem entendesse a qualquer hora. Sim, as forças sociais e morais que regem o mundo sempre regularam suas decisões, mas agora o mais simples ato parece incerto; seja desligar o despertador, se espreguiçar ou até mesmo se levantar do sofá.")
        }
    }

    static func mockInfos() -> StoryViewModel {
        let viewModel = StoryViewModel()
        viewModel.decisions = ["Coxinha", "Risóles", "Esfirra", "Empadaadsasadsadads"]
        viewModel.textInfos = TextInfos.mockText()
        viewModel.imagePath = "cap1_1"
        return viewModel
    }
}
