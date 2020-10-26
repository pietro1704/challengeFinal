//
//  DynamicTypes.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 26/10/20.
//

import Foundation

public enum DynamicTypes {
    case random
    case choice
    case bet
    
    func title() -> String {
        switch self {
        case .random:
            return "Aleatório"
        case .choice:
            return "Escolha"
        case .bet:
            return "Aposta"
        }
    }

    func imagePath() -> String {
        switch self {
        case .random:
            return "random"
        case .choice:
            return "choice"
        case .bet:
            return "bet"
        }
    }

}
