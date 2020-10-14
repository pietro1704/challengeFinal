//
//  StoryViewInfos.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import Foundation

public protocol StoryViewInfos {
    var imagePath: String? { get set }
    var textInfos: RegularTextViewInfos { get set }
    var decisions: [String]? { get set }
}
