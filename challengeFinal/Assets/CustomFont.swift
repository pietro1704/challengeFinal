//
//  CustomFont.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 28/10/20.
//

import Foundation
import UIKit

extension UIFont {
    static func heptaRegular(size: CGFloat = 17) -> UIFont {
        var font = UIFont(name: "HeptaSlab-Regular", size: size)!
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        return font
    }
    
    static func heptaBold(size: CGFloat = 17) -> UIFont {
        var font = UIFont(name: "HeptaSlab-Bold", size: size)!
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        return font
    }
}
