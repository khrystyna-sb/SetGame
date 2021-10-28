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
            AspectVGrid(viewModel.cards) { card in
                CardView(card : card)
                    .onTapGesture {
                        //some actions
                    }
            }
        }
        .padding(5)
    }
}



struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetGameViewModel())
    }
}



