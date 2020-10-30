//
//  UIILabel+Animation.swift
//  
//
//  Created by Ivo Dutra on 27/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import UIKit.UIView

extension UIView {

    // MARK: - Animations
    // All animations must be called at each transaction

    func fadeTransition() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = 1
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }

    func increaseAnimation() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.duration = 1
        animation.subtype = CATransitionSubtype.fromTop
        layer.add(animation, forKey: CATransitionType.push.rawValue)
    }

    func decreaseAnimation() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.duration = 1
        animation.subtype = CATransitionSubtype.fromBottom
        layer.add(animation, forKey: CATransitionType.push.rawValue)
    }
}

