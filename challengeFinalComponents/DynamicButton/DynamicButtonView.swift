//
//  DynamicButtonView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 23/10/20.
//

import UIKit

public protocol DynamicButtonDelegate: class {
    func buttonPressed(_ tag: Int)
}

let buttonWidth: CGFloat = 75.0
let buttonHeight: CGFloat = 52.0
public class DynamicButton: UIView {
    
    //is button selected: alpha = 0 or 1
    var isSelected = true
    
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
        return label
    }()

    public init(title: String, imagePath: String, isSelected:Bool = true) {
        super.init(frame: .zero)
        self.isSelected = isSelected
        self.title.text = title
        self.imageView.recievedImagePath(imagePath: imagePath)
        setupConstraints()
        setupImageTextIsSelected(isSelected: isSelected)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupImageTextIsSelected(isSelected:Bool){
        if isSelected{
            imageView.alpha = 1
            title.alpha = 1
        }else{
            imageView.alpha = 0.5
            title.alpha = 0.5
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: title.topAnchor),
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
