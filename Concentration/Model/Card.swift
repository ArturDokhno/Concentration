//
//  Card.swift
//  Concentration
//
//  Created by Артур Дохно on 23.04.2022.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    init() {
        self.identifier = Card.getUniqueIndentifier()
    }
    
    static func getUniqueIndentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
