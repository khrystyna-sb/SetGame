//
//  ContentView.swift
//  SetGame
//
//  Created by Mac on 18.10.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            let card = Card(shape: .circle, shapeCount: .one, texture: .fill, color: .green, isSelected: true)
            CardView(card: card)
            CardView(card: card)
            CardView(card: card)
        } .padding()
    }
}

struct CardView: View {
    @State var card: Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
                .stroke()
//            let cardShape = card.shape
            if card.isSelected {
                shape.stroke(lineWidth: 5).padding().foregroundColor(.red)
            } else {
                shape.stroke(lineWidth: 1).padding().foregroundColor(.red)
            }
        }
        .onTapGesture {
            card.isSelected = !card.isSelected
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
