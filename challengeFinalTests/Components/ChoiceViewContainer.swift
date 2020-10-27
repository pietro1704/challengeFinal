//
//  ChoiceViewContainer.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import UIKit

public class ChoiceViewContainer: UIView {
    
    lazy var choiceView: ChoiceView = {
        let cView = ChoiceView()
        addSubview(cView)
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
    }()

    var viewModel: ChoiceViewModel?

    public init() {
        super.init(frame: .zero)
        setupConstraints()
    }

    public init(viewModel: ChoiceViewModel) {
        super.init(frame: .zero)
        self.viewModel = viewModel

        setupChapterView(viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(using viewModel: ChoiceViewModel?) {
        guard let viewModel = viewModel else { return }

        setupChapterView(viewModel)
    }

    private func setupChapterView(_ viewModel: ChoiceViewModel) {
        if let infos = viewModel.infos{
            choiceView.update(with: infos)
        }
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            choiceView.topAnchor.constraint(equalTo: topAnchor),
            choiceView.leadingAnchor.constraint(equalTo: leadingAnchor),
            choiceView.trailingAnchor.constraint(equalTo: trailingAnchor),
            choiceView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
