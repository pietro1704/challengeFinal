//
//  ViewDelegate.swift
//  challengeFinal
//
//  Created by Ivo Dutra on 02/11/20.
//

import Foundation

/// StoryViewModel's reference to StoryView
public protocol ViewDelegate: AnyObject {

    func updateHUD(with points: Int)
}
