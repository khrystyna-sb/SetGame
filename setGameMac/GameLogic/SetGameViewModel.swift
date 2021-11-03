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
        return gameModel?.cardsInGame ?? [Card]()
    }
    
    func chooseCard(card chosenCard : Card) {
        gameModel?.choose(card: chosenCard)
    }
    
    func newGame() {
        gameModel = SetGame()
        assert(gameModel?.dealCards(with : numberOfCardsAtStart) == numberOfCardsAtStart)
    }
    
    init() {
        gameModel = SetGame()
    }
}
