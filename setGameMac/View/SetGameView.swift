//
//  ContentView.swift
//  SetGame
//
//  Created by Kristina on 18.10.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SetGameViewModel
    
    var body: some View {
        VStack {
            AspectVGrid(viewModel.cardsInGame) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.viewModel.chooseCard(card: card)
                    }
            }
            .onAppear {
                self.viewModel.newGame()
            }
        }
    }
    
    
}



struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetGameViewModel())
    }
}



