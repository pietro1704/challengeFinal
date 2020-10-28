//
//  DecisionPointsView.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 28/10/20.
//

import Foundation
import UIKit

var defaultLabelSize: CGFloat = 24

class DecisionPointsView: UIStackView {
    
    var imageView: UIImageView = {
        let imageview = UIImageView()
        //mudar imagem pro asset do jogo
        imageview.image = UIImage(systemName: "speaker.fill")
        //our custom red color
        imageview.tintColor = UIColor.gameRed
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    var pointsLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(numberOfPoints: Int = 0, textSize: CGFloat = defaultLabelSize){
        let rect = CGRect(x: 0, y: 0, width: 80, height: 32)
        super.init(frame: rect)
        pointsLabel.font = pointsLabel.font.withSize(textSize)
        setupConstrains()

    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrains(){
        self.addArrangedSubview(imageView)
        self.addArrangedSubview(pointsLabel)
        self.axis = .horizontal
        self.alignment = .fill
        self.spacing = 8
    }
}
