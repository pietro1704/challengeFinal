//
//  ImageView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 09/10/20.
//

import UIKit

public class ImageView: UIView {

    public var imageWidth: CGFloat = 414.0
    public var imageHeight: CGFloat = 375.0

    private lazy var imageView: UIImageView = {
        let iView = UIImageView()
        addSubview(iView)
        iView.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
        iView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        iView.translatesAutoresizingMaskIntoConstraints = false
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
}
