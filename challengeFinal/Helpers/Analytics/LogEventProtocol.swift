//
//  LogEventProtocol.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 24/11/20.
//

import Foundation

public protocol LogEventProtocol {
    func tapButton(named: String, on screen: String, parameters: [String: Any]?)
//    func scrollView(named: String, on screen: String, parameters: [String: Any]?, isInvert: Bool)
//    func scrollDownTo(named: String, on screen: String, parameters: [String: Any]?)
    func logEvent(_ name: String, parameters: [String: Any]?)
    func saveUserProperty(property: String?, key: String)
    func logScreen(for name: String, and className: String?)
}
