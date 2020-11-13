//
//  ChapterView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 22/10/20.
//

import UIKit

public class ChapterView: UIView {
    lazy var image: ImageView = {
        let image = ImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.imageView.contentMode = .scaleAspectFill
        addSubview(image)
        return image
    }()

    lazy var titleBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.85
        addSubview(view)
        view.addSubview(title)
        view.addSubview(subTitle)
        view.addSubview(scrollDownImage)
        return view
    }()

    lazy var title: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.font = UIFont.heptaBold(size: 24)
        title.textAlignment = .center
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    lazy var subTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.heptaRegular(size: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var scrollDownImage: ImageView = {
        let image = ImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .bold, scale: .large)
        let arrow = UIImage(systemName: "arrow.down", withConfiguration: imageConfig) ?? UIImage()
        image.recievedImage(image: arrow)
        image.tintColor = .white
        return image
    }()

    var accentColor: String
    public init(title: String, subTitle: String, imagePath: String, accentColor: String = "Red") {
        self.accentColor = accentColor
        super.init(frame: .zero)
        self.title.text = title
        self.subTitle.text = subTitle
        titleBackground.backgroundColor = UIColor(named: accentColor)
        if let image = UIImage(named: imagePath) {
            self.image.recievedImage(image: image)
        }
        backgroundColor = .background
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func update(title: String, subTitle: String, imagePath: String, accentColor: String = "Red") {
        self.title.text = title
        self.subTitle.text = subTitle
        if let image = UIImage(named: imagePath) {
            self.image.recievedImage(image: image)
        }
    }

    private func setupConstraints() {
        sendSubviewToBack(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            titleBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleBackground.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            title.topAnchor.constraint(equalTo: titleBackground.topAnchor, constant: 32),
            title.leadingAnchor.constraint(equalTo: titleBackground.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: titleBackground.trailingAnchor),
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            subTitle.leadingAnchor.constraint(equalTo: titleBackground.leadingAnchor),
            subTitle.trailingAnchor.constraint(equalTo: titleBackground.trailingAnchor),
            scrollDownImage.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 16),
            scrollDownImage.centerXAnchor.constraint(equalTo: titleBackground.centerXAnchor),
            scrollDownImage.bottomAnchor.constraint(equalTo: titleBackground.bottomAnchor, constant: -16)
        ])
    }
}
