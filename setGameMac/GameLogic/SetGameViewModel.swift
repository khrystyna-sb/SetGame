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
    
    var cards: [Card] {
        gameModel?.cardsInDeck ?? [Card]()
    }
    
    init() {
        gameModel = SetGame()
    }
}
