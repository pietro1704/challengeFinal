//
//  DynamicButtonView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 23/10/20.
//

import UIKit

public protocol DynamicButtonDelegate: class {
    func buttonPressed(_ type: DynamicTypes)
}

let buttonWidth: CGFloat = 75.0
let buttonHeight: CGFloat = 52.0
let notSelectedAlpha: CGFloat = 0.3
public class DynamicButton: UIView {
    
    var isSelected: Bool
    weak var delegate: DynamicButtonDelegate?
    var type: DynamicTypes
    
    lazy var imageView: ImageView = {
        let image = ImageView()
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        image.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        return image
    }()

    lazy var title: UILabel = {
        let label = UILabel()
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.heptaBold(size: 11)
        label.adjustsFontForContentSizeCategory = true
        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        return label
    }()

    public init(type: DynamicTypes, isSelected: Bool = false) {
        self.isSelected = isSelected
        self.type = type
        super.init(frame: .zero)
        self.title.text = type.title()
        self.imageView.recievedImagePath(imagePath: type.imagePath())
        setupConstraints()
        setupImageTextIsSelected(isSelected: isSelected)
        backgroundColor = .clear
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tapped() {
        self.delegate?.buttonPressed(self.type)
    }

    private func setupImageTextIsSelected(isSelected: Bool) {
        if isSelected {
            imageView.alpha = 1
        } else {
            imageView.alpha = notSelectedAlpha
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
