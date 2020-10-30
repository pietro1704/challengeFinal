//
//  RegularTextView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public class RegularTextView: UITextView {
    
    public init(fontSize: CGFloat = 17) {
        super.init(frame: .zero, textContainer: nil)
        // System font
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.isEditable = false
        self.isScrollEnabled = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with infos: RegularTextViewInfos) {
        self.text = infos.text
    }

    public func configure(with text: String) {
        self.text = text
    }
}
