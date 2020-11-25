//
//  LoggableScreen.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 24/11/20.
//

protocol LoggableScreen {
    func screenName() -> String
    func logger() -> LogEventProtocol?
}

extension LoggableScreen {

    func tapButton(named: String, and parameters: [String: Any]? = nil) {
        logger()?.tapButton(named: named, on: screenName(), parameters: parameters)
    }

    func logScreen(for classString: String?) {
        logger()?.logScreen(for: screenName(), and: classString)
    }

}
