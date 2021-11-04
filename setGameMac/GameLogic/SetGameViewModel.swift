//
//  SetGameViewModel.swift
//  setGameMac
//
//  Created by Kristina on 27.10.2021.
//

import Foundation

final class SetGameViewModel: ObservableObject{
    
    @Published private(set) var gameModel: SetGame?
    
    private let numberOfCardsAtStart: Int = 12
    
    var cardsInDeck: [Card] {
        gameModel?.cardsInDeck ?? [Card]()
    }
    
    var cardsInGame: [Card] {
        gameModel?.cardsInGame ?? [Card]()
    }
    
    var discardPile: [Card] {
        gameModel?.discardPile ?? [Card]()
    }
    
    func deal3Cards() {
        gameModel?.dealCards(with: 3)
    }
    
    func chooseCard(card chosenCard : Card) {
        gameModel?.choose(card: chosenCard)
    }
    
    func newGame() {
        gameModel?.dealCards(with: numberOfCardsAtStart)
    }
    
    init() {
        gameModel = SetGame()
    }
}
