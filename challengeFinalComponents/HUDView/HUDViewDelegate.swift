//
//  HUDViewDelegate.swift
//  challengeFinal
//
//  Created by Ivo Dutra on 02/11/20.
//

import Foundation

/// StoryViewModel's reference to StoryView and
/// ChoiceViewModel's reference to ChoiceView
public protocol HUDViewDelegate: AnyObject {

    func updateHUD(with points: Int)
}
