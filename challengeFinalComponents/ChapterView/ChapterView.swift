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
        addSubview(image)
        image.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        image.heightAnchor.constraint(equalTo: image.widthAnchor).isActive = true
        return image
    }()

    lazy var title: ChapterInitLabel = {
        let title = ChapterInitLabel(with: "")
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        return title
    }()

    public init(title: String, imagePath: String, accentColor: String = "Red") {
        super.init(frame: .zero)
        self.title.update(with: title, colorName: accentColor)
        if let image = UIImage(named: imagePath) {
            self.image.recievedImage(image: image)
        }
        if let bgColor = UIColor(named: "Background") {
            backgroundColor = bgColor
        }
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func update(title: String, imagePath: String, accentColor: String = "Red") {
        self.title.update(with: title, colorName: accentColor)
        if let image = UIImage(named: imagePath) {
            self.image.recievedImage(image: image)
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 36),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 36),
            title.centerXAnchor.constraint(equalTo: image.centerXAnchor)
        ])
    }
}
