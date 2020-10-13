//
//  MockView.swift
//  challengeFinalTests
//
//  Created by Guilherme Domingues on 13/10/20.
//

import UIKit

extension UIView {
    func addInCenterOnMockViewIphone11() -> UIView {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 828, height: 1792))

        containerView.addSubview(self)
        containerView.backgroundColor = .white

        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        return containerView
    }
}
