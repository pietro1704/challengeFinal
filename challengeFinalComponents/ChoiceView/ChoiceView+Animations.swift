//
//  ChoiceView+Animations.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 06/11/20.
//

import UIKit

extension ChoiceView: CAAnimationDelegate {

    func animateTo(nodeId: NodeID) {
        choiceButtons.arrangedSubviews.forEach { (button) in
            guard let button = button as? ChoiceButton else { return }
            if button.nodeId == nodeId {
                choiceButtonTapped = button
            }
        }
        
        if currentAnimation < maxAnimation {
            startAnimationAgain()
        } else {
            choiceButtonTapped?.layer.opacity = 1
        }
    }
    
    func blink(choiceButton: ChoiceButton?, withDuration: Double) {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.delegate = self
        flash.duration = withDuration
        flash.fromValue = 0
        flash.toValue = 1
        flash.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        choiceButton?.highlightIndicator.layer.add(flash, forKey: nil)
    }

    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if anim.repeatCount == Float(maxAnimation) {
            self.delegate?.animationFinished()
            return
        }

        let index = lastAnimatedIndex + 1
        guard let nodes = infos?.nodes, index < nodes.count else {
            startAnimationAgain()
            return
        }
        guard let nodeToAnimate = choiceButtons.arrangedSubviews[index] as? ChoiceButton else { return }

        blink(choiceButton: nodeToAnimate, withDuration: currentDuration)
        lastAnimatedIndex = index
    }

    private func startAnimationAgain() {
        guard currentAnimation < maxAnimation else {
            currentAnimation = 0
            finshAnimation()
            return
        }

        lastAnimatedIndex = 0
        currentAnimation += 1
        guard let nodeToAnimate = choiceButtons.arrangedSubviews[lastAnimatedIndex] as?
                ChoiceButton else { return }

        currentDuration = currentAnimation != 0 ? stdDuration/(Double(currentAnimation)) : stdDuration

        blink(choiceButton: nodeToAnimate, withDuration: currentDuration)
    }

    private func finshAnimation() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.delegate = self
        flash.duration = 0.3
        flash.fromValue = 0
        flash.toValue = 1
        flash.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = Float(maxAnimation)
        choiceButtonTapped?.highlightIndicator.layer.add(flash, forKey: nil)
    }
}
