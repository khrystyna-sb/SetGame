//
//  Card.swift
//  SetGame
//
//  Created by Mac on 18.10.2021.
//

import Foundation
import UIKit
import SwiftUI

struct Card {
    
//    enum CardShape: CaseIterable {
//        static let rectangle = RoundedRectangle(cornerRadius: 20)
//        static let circle = Circle()
//        static let capsule = Capsule()
//    }
//
    
    enum CardShape: Int, CaseIterable {
        case rectangle 
        case circle
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

    enum Color: Int, CaseIterable {
        case red
        case purpule
        case green
    }
    
    let shape: CardShape
    let shapeCount: ShapeCount
    let texture: Texture
    let color: Color
    var isSelected: Bool
    
    init(shape: CardShape, shapeCount: ShapeCount, texture: Texture, color: Color, isSelected: Bool ) {
        self.shape = shape
        self.shapeCount = shapeCount
        self.texture = texture
        self.color = color
        self.isSelected = isSelected
    }
    
    func drawColor() -> UIColor {
        switch color {
        case .green:
            return UIColor.green
        case .purpule:
            return UIColor.purple
        case .red:
            return UIColor.red
        }
    }
    
//    func chooseShape() -> <Cardshape> where Cardshape: Shape {
//        switch shape {
//        case .rectangle:
//            return RoundedRectangle(cornerRadius: 20)
//        case .circle:
//            return RoundedRectangle(cornerRadius: 20)
////            return Circle()
//        case .capsule:
//            return RoundedRectangle(cornerRadius: 20)
////            return Capsule()
//        }
//    }
    
}


