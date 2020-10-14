//
//  StoryView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public class StoryView: UIView {

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
        textView.backgroundColor = .green
        return textView
    }()

    private lazy var stackview: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.backgroundColor = .purple
        return stack
    }()

    public init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 0.89, green: 0.88, blue: 0.85, alpha: 1.00)

        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        textView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 32).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        
        stackview.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10).isActive = true
        stackview.leadingAnchor.constraint(equalTo: textView.leadingAnchor).isActive = true
        stackview.trailingAnchor.constraint(equalTo: textView.trailingAnchor).isActive = true
        stackview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with infos: StoryViewInfos) {
        self.imageView.recievedImage(image: loadImage(infos.imagePath))
        self.textView.configure(with: infos.textInfos)
        configureDecisions(infos.decisions)
    }

    public func loadImage(_ imagePath: String?) -> UIImage {
        guard let imagePath = imagePath,
              let image = UIImage(named: imagePath) else { return UIImage() }
        return image
    }

    private func configureDecisions(_ decisions: [String]?) {
        guard let decisions = decisions else { return }

        decisions.forEach { (caption) in
            let button = PrimaryButton(title: caption)
            button.translatesAutoresizingMaskIntoConstraints = false
            stackview.addArrangedSubview(button)
        }
    }
}
