//
//  AnalyticsService.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 24/11/20.
//

import Foundation
import FirebaseAnalytics

let separator: String = "_"

public class AnalyticsLogger: LogEventProtocol {
    public func tapButton(named: String, on screen: String, parameters: [String: Any]?) {
        let eventName = "tap\(separator)" + screen + "\(separator)" + named
        logEvent(eventName, parameters: parameters)
    }

    public func logEvent(_ name: String, parameters: [String: Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
    
    public func saveUserProperty(property: String?, key: String) {
        Analytics.setUserProperty(property, forName: key)
    }

    public func logScreen(for name: String, and className: String?) {
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: name,
                                        AnalyticsParameterScreenClass: className ?? ""])
    }
}
