//
//  CardView.swift
//  setGameMac
//
//  Created by Khrystyna Matasova on 28.10.2021.
//

import SwiftUI

struct CardView: View {
    
    var card : Card
    private let radius : CGFloat = 10.0
    private let lineWidth : CGFloat = 3.0
    private let frameWidth : CGFloat = 1.0
    private let cardColor = Color.white
    private let frameColor = Color.gray
    
    var colorToUIColor: [Card.ShapeColor : Color] {
        get {
            return [
                .red : Color.red,
                .green : Color.green,
                .purple : Color.purple
            ]
        }
    }
    
    var body: some View {
        GeometryReader{ geometry in
            self.body(for: geometry.size, of: self.card)
        }
    }
    
    private func body (for size : CGSize, of card : Card) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: radius).fill(card.statusColor)
            RoundedRectangle(cornerRadius: radius).stroke(lineWidth: frameWidth)
                .foregroundColor(frameColor)
            
            VStack {
                symbolSpacer(for : size)
                ForEach(0..<(card.shapeCount.rawValue + 1)) { _ in
                    self.shape(of: card, with: self.lineWidth)
                        .cardShapesLayout(size: size, color: self.colorToUIColor[card.color]!)
                    self.symbolSpacer(for : size)
                }
            }
        }
    }

    @ViewBuilder
   // rewrite to some switch case or ???
    private func shape (of card: Card, with lineWidth: CGFloat) -> some View {
        
        if card.shape == Card.CardShape.diamond {
            if card.texture == Card.Texture.stroke {
                Diamond().stroke(lineWidth : lineWidth)
            } else if card.texture == Card.Texture.fill {
                Diamond().fill()
            } else {
                Diamond().fill().opacity(0.2)
            }
        } else if card.shape == Card.CardShape.wave {
            if card.texture == Card.Texture.stroke {
                Wave().stroke(lineWidth : lineWidth)
            } else if card.texture == Card.Texture.fill {
                Wave().fill()
            } else {
                Wave().fill().opacity(0.2)
            }
        } else if card.shape == Card.CardShape.capsule {
            if card.texture == Card.Texture.stroke {
                Capsule().stroke(lineWidth : lineWidth)
            } else if card.texture == Card.Texture.fill {
                Capsule().fill()
            } else {
                Capsule().fill().opacity(0.2)
            }
        }
    }
    
    private func symbolSpacer(for size : CGSize) -> some View {
        let spacingHeightToCardHeight = CGFloat( 0.5 / 6.0)
        return Spacer(minLength : size.height * spacingHeightToCardHeight)
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
       CardView(card: Card(shape: .capsule, shapeCount: .three, texture: .halffill, color: .purple))
            .padding()
    }
}


extension Card {
    var statusColor : Color {
        let defaultColor = Color.white
        let chosenColor = Color.gray
        let setColor = Color.yellow
        
        var color = defaultColor
        
        if self.isPartOfSet && !self.isRemoved {
            color = setColor
        } else if self.isSelected || self.isMisMatch {
            color = chosenColor
        }
        
        return color
    }
}
