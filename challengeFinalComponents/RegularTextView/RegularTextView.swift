//
//  RegularTextView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public class RegularTextView: UITextView {

    public init(fontSize: CGFloat = 16) {
        super.init(frame: .zero, textContainer: nil)
        // Custom scaled font
        self.font = UIFont.heptaRegular(size: fontSize)
        self.adjustsFontForContentSizeCategory = true
        
        self.isEditable = false
        self.isScrollEnabled = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with infos: RegularTextViewInfos) {
        configure(with: infos.text, lineSpacing: infos.lineSpacing)
    }

    public func configure(with text: String, lineSpacing: CGFloat = 8) {
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        attributedString.addAttribute(.paragraphStyle,
                                      value:paragraphStyle,
                                      range:NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(.font,
                                      value: self.font ?? UIFont.heptaRegular(size: 17),
                                      range: NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
    }
    
    func boldText(_ textToBold: String, fontSize: CGFloat = 16) {
        let boldFont = UIFont.heptaBold(size: fontSize)
        let attributedString = NSMutableAttributedString(attributedString: self.attributedText)
        
        guard let range = attributedString.string.range(of: textToBold) else {
            return
        }
        let nsRange = NSRange(range, in: attributedString.string)
        attributedString.addAttribute(.font,
                                      value: boldFont,
                                      range: nsRange)
        
        self.attributedText = attributedString
    }
}
