//
//  ChapterViewContainer.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 22/10/20.
//

import UIKit

public class ChapterViewContainer: UIView {
    
    lazy var chapterView: ChapterView = {
        let cView = ChapterView(title: "", subTitle: "", imagePath: "nil")
        addSubview(cView)
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
    }()

    var viewModel: ChapterViewModel?

    public init() {
        super.init(frame: .zero)
        let scrollGesture = UISwipeGestureRecognizer(target: self,
                                                     action: #selector(swipeUp))
        scrollGesture.direction = .up
        addGestureRecognizer(scrollGesture)
    }

    public init(viewModel: ChapterViewModel) {
        super.init(frame: .zero)
        self.viewModel = viewModel

        setupChapterView(viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(using viewModel: ChapterViewModel?) {
        guard let viewModel = viewModel else { return }

        setupChapterView(viewModel)
    }

    @objc func swipeUp() {
        viewModel?.userWantToShowStory()
    }

    private func setupChapterView(_ viewModel: ChapterViewModel) {
        if let node = viewModel.node,
           let title = node.title, let imagePath = node.imagePath {
            chapterView.update(title: title, subTitle: title, imagePath: imagePath)
        }
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            chapterView.topAnchor.constraint(equalTo: topAnchor),
            chapterView.leadingAnchor.constraint(equalTo: leadingAnchor),
            chapterView.trailingAnchor.constraint(equalTo: trailingAnchor),
            chapterView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
