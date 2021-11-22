//
//  Card.swift
//  SetGame
//
//  Created by Kristina on 18.10.2021.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    
    var id: UUID
    let shape: CardShape
    let shapeCount: ShapeCount
    let texture: Texture
    let color: ShapeColor
    
    
    enum CardShape: Int, CaseIterable {
        case diamond
        case wave
        case capsule
    }
    
    enum ShapeCount: Int, CaseIterable {
        case one 
        case two
        case three 
    }
    
    enum Texture: Int, CaseIterable {
        case fill
        case stroke
        case halffill
    }
    
    enum ShapeColor: Int, CaseIterable {
        case red
        case purple
        case green
    }
    
    var isPartOfSet : Bool
    var isSelected : Bool
    var isMisMatch : Bool
    var isRemoved : Bool
    
    init(shape: CardShape, shapeCount: ShapeCount, texture: Texture, color: ShapeColor) {
        self.id = UUID()
        self.isPartOfSet = false
        self.isSelected = false
        self.isMisMatch = false
        self.isRemoved = false
        self.shapeCount = shapeCount
        self.shape = shape
        self.texture = texture
        self.color = color
    }
}

