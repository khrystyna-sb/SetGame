//
//  SetGame.swift
//  setGameMac
//
//  Created by Kristina on 26.10.2021.
//

import Foundation

struct SetGame {
    
    private(set) var cardsInDeck = [Card]()
    private(set) var cardsInGame = [Card]()
    
    
    init() {
        cardsInDeck = CardsFactory.generateCards()
    }
    
}



