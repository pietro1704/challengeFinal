//
//  StoryView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public class StoryView: UIView {

    public var viewModel: StoryViewModel {
        didSet {
            prepareForReuse()
            configure(using: viewModel)
        }
    }

    private lazy var imageView: ImageView = {
        let imageView = ImageView()
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var textView: RegularTextView = {
        let textView = RegularTextView()
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private lazy var stackview: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.axis = .vertical
        addSubview(stack)
        return stack
    }()

    public init(with viewModel: StoryViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 0.89, green: 0.88, blue: 0.85, alpha: 1.00)
        setupConstraints()
    }

    fileprivate func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        
        textView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 32).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        
        stackview.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10).isActive = true
        stackview.leadingAnchor.constraint(equalTo: textView.leadingAnchor).isActive = true
        stackview.trailingAnchor.constraint(equalTo: textView.trailingAnchor).isActive = true
        stackview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        stackview.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(using infos: StoryViewModel) {
        let node = infos.node
        self.imageView.recievedImage(image: loadImage(node?.imagePath))
        configureDecisions(node?.childNodes)

        if let textInfos = node?.text {
            self.textView.configure(with: textInfos)
        }
    }

    public func loadImage(_ imagePath: String?) -> UIImage {
        guard let imagePath = imagePath,
              let image = UIImage(named: imagePath) else { return UIImage() }
        return image
    }

    private func configureDecisions(_ decisions: [StoryNode]?) {
        guard let decisions = decisions else { return }

        for i in 0..<decisions.count {
            let node = decisions[i]
            let button = PrimaryButton(title: String(node.title ?? ""))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = i
            button.delegate = self
            stackview.addArrangedSubview(button)
        }
    }

    private func prepareForReuse() {
        stackview.arrangedSubviews.forEach { (arrangedSubview) in
            arrangedSubview.removeFromSuperview()
        }
    }
}

extension StoryView: PrimaryButtonDelegate {
    public func buttonPressed(_ buttonTag: Int) {
        let nodeViewModel = StoryViewModel()
        nodeViewModel.node = viewModel.node?.childNodes[buttonTag]
        self.viewModel = nodeViewModel
    }
}
