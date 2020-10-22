//
//  ChapterViewController.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 22/10/20.
//

import UIKit

class ChapterViewController: UIViewController, Storyboarded {
    weak var coordinator: ChapterCoordinator?

    var containerView: ChapterViewContainer = {
        let chapterView = ChapterViewContainer()
        chapterView.translatesAutoresizingMaskIntoConstraints = false
        return chapterView
    }()

    var viewModel: ChapterViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        containerView.viewModel = viewModel
        containerView.configure(using: viewModel)
        view.addSubview(containerView)
        setupConstraints()
    }

    public func update(with viewModel: ChapterViewModel) {
        self.viewModel = viewModel
        containerView.viewModel = viewModel
        containerView.configure(using: viewModel)
    }

    private func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
