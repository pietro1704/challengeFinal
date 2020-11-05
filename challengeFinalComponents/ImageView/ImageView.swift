//
//  ImageView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 09/10/20.
//

import UIKit

public class ImageView: UIView {

    public lazy var imageView: UIImageView = {
        let iView = UIImageView()
        addSubview(iView)
        iView.translatesAutoresizingMaskIntoConstraints = false
        iView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        iView.contentMode = .scaleAspectFit
        return iView
    }()

    public init() {
        super.init(frame: .zero)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func recievedImage(image: UIImage) {
        self.imageView.image = image
    }

    public func recievedImagePath(imagePath: String) {
        if let image = UIImage(named: imagePath) {
            self.imageView.image = image
        }
    }
}
