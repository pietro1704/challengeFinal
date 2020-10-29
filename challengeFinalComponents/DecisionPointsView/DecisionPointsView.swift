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
        imageview.tintColor = UIColor.accentRed
        
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
        super.init(frame: .zero)
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
        self.alignment = .center
        self.spacing = 8
    }
}
