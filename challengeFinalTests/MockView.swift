//
//  MockView.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 13/10/20.
//

import UIKit

extension UIView {

    func addInCenterAndSidesOnMockViewIphone11() -> UIView {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 828, height: 1792))

        containerView.addSubview(self)
        containerView.backgroundColor = .white

        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true

        self.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true

        return containerView
    }

    func addInCenterOnMockViewIphone11() -> UIView {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 828, height: 1792))

        containerView.addSubview(self)
        containerView.backgroundColor = .white

        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        return containerView
    }

    func addInCenterOnMockViewIphone11Landscape() -> UIView {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 1792, height: 828))

        containerView.addSubview(self)
        containerView.backgroundColor = .white

        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        return containerView
    }
}
