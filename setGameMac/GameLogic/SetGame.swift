//
//  SetGame.swift
//  setGameMac
//
//  Created


struct SetGame {
    
    private(set) var cardsInDeck = [Card]()
    private(set) var cardsInGame = [Card]()
    
    private var chosenCards : [Card]? {
        get {
            let chosenCardIndices = cardsInGame.indices.filter {cardsInGame[$0].isSelected}
            return chosenCardIndices.count > 0 ? chosenCardIndices.map { cardsInGame[$0] } : nil
        }
    }
    
    var setCards: [Card]? {
        get {
            let chosenCardIndices = cardsInGame.indices.filter {cardsInGame[$0].isPartOfSet}
            return chosenCardIndices.count > 0 ? chosenCardIndices.map { cardsInGame[$0] } : nil
        }
    }
    
    private var misMatchedCards : [Card]? {
        get {
            let chosenCardIndices = cardsInGame.indices.filter {cardsInGame[$0].isMisMatch}
            return chosenCardIndices.count > 0 ? chosenCardIndices.map { cardsInGame[$0] } : nil
        }
    }
    
    mutating func dealCards(with numberOfCards: Int) -> Int {
        
                if let setFoundBefore = setCards {
                    if setFoundBefore.count == numberOfCards {
                        setFoundBefore.unmark(in: &cardsInGame)
                        replaceCards (for : setFoundBefore)
                    }
                    return 0
                }
        
        if cardsInDeck.count >= numberOfCards {
            for i in 0..<numberOfCards {
                if let card = cardsInDeck.popLast() {
                    cardsInGame.append(card)
                    print(i)
                } else {
                    break
                }
            }
            return numberOfCards
        } else {
            return 0
        }
    }
    
    mutating func replaceCards (for set: [Card]) {
        let numberOfCardsToBeReplaced = set.count
        if cardsInDeck.count >= numberOfCardsToBeReplaced {
            for i in 0..<numberOfCardsToBeReplaced {
                if let card = cardsInDeck.popLast() {
                    cardsInGame[cardsInGame.firstIndex(matching: set[i])!] = card //how to remove !
                } else {
                    break
                }
            }
        } else {
            set.remove(in : &cardsInGame)
        }
    }
    
    mutating func choose(card : Card) {
        guard let index = cardsInGame.firstIndex(matching: card) else { return }
        let currentCard = cardsInGame[index]
        
        if currentCard.isSelected {
            cardsInGame[index].isSelected = false
        } else {
            if !(currentCard.isPartOfSet || currentCard.isMisMatch) {
                cardsInGame[index].isSelected = true
            }
        }
        
        if cardsInGame[index].isSelected {
            if let chosenCards = chosenCards {
                if chosenCards.count == 3 {
                    if chosenCards.areASet {
                        chosenCards.markAsSet(in : &cardsInGame)
                    } else {
                        chosenCards.markAsMisMatch(in : &cardsInGame)
                    }
                }   else if chosenCards.count == 1 {
                    if let setFoundBefore = setCards {
                        setFoundBefore.unmark(in : &cardsInGame)
                        replaceCards (for : setFoundBefore)
                    } else if let misMatchedFoundBefore = misMatchedCards {
                        misMatchedFoundBefore.unmark(in : &cardsInGame)
                    }
                }
            }
        }
    }
    
    init() {
        cardsInDeck = CardsFactory.generateCards()
    }
}

private extension Array where Element == Card {
    
    var haveSameNumberOrThreeDifferentNumbers : Bool {
        get {
            let number0 = self[0].shapeCount
            let sameNumber = (number0 == self[1].shapeCount) && (number0 == self[2].shapeCount)
            let threeDifferentNumbers = (number0 != self[1].shapeCount) && (number0 != self[2].shapeCount) &&
            (self[1].shapeCount != self[2].shapeCount)
            return sameNumber || threeDifferentNumbers
        }
    }

    var haveSameShapeOrThreeDifferentShapes : Bool {
        get {
            let shape0 = self[0].shape
            let sameShape = (shape0 == self[1].shape) && (shape0 == self[2].shape)
            let threeDifferentShapes = (shape0 != self[1].shape) && (shape0 != self[2].shape) &&
            (self[1].shape != self[2].shape)
            return sameShape || threeDifferentShapes
        }
    }
    
    var haveSameShadingOrThreeDifferentShadings : Bool {
        get {
            let shading0 = self[0].texture
            let sameShading = (shading0 == self[1].texture) && (shading0 == self[2].texture)
            let threeDifferentShadings = (shading0 != self[1].texture) && (shading0 != self[2].texture) &&
            (self[1].texture != self[2].texture)
            return sameShading || threeDifferentShadings
        }
    }
    
    var haveSameColorOrThreeDifferentColors : Bool {
        get {
            let color0 = self[0].color
            let sameColor = (color0 == self[1].color) && (color0 == self[2].color)
            let threeDifferentColors = (color0 != self[1].color) && (color0 != self[2].color) &&
            (self[1].color != self[2].color)
            return sameColor || threeDifferentColors
        }
    }
    
    var areASet : Bool {
        get {
            (self.haveSameNumberOrThreeDifferentNumbers ?
             (self.haveSameShapeOrThreeDifferentShapes ?
              (self.haveSameShadingOrThreeDifferentShadings ?
               (self.haveSameColorOrThreeDifferentColors ? true : false)
               :false)
              :false)
             :false)
        }
    }
    
    func markAsSet (in cards : inout [Element]) {
        for card in self {
            if let index = cards.firstIndex(matching: card){
                cards[index].isPartOfSet = true
                cards[index].isSelected = false
            }
        }
    }
    
    func markAsMisMatch (in cards : inout [Element]) {
        for card in self {
            if let index = cards.firstIndex(matching: card){
                cards[index].isMisMatch = true
                cards[index].isSelected = false
            }
        }
    }
    
    func unmark(in cards : inout [Element]) {
        for card in self {
            if let index = cards.firstIndex(matching: card){
                cards[index].isMisMatch = false
                cards[index].isSelected = false
                cards[index].isPartOfSet = false
            }
        }
    }
    
    func remove(in cards : inout [Element]) {
        for card in self {
            if let index = cards.firstIndex(matching: card){
                cards[index].isMisMatch = false
                cards[index].isSelected = false
                cards[index].isPartOfSet = false
                cards[index].isRemoved = true
            }
        }
    }
}


//Comparable
