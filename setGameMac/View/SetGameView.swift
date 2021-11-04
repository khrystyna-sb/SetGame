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
            gameBody
            HStack {
                deckBody
                Spacer()
                discardPile
            } 
        }
    }
    
    @Namespace private var dealingNamespace
    
    @State private var dealt = Set<UUID>()
    
    private func deal(_ card: Card) { dealt.insert(card.id) }
    
    private func isDealt(_ card: Card) -> Bool { dealt.contains(card.id) }
    
    private func dealAnimation(for card: Card) -> Animation {
        var delay = 0.0
        if let index = viewModel.cardsInGame.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * (DealConstants.totalDealDuration / 12)
        }
        return Animation.easeInOut(duration: DealConstants.dealDuration).delay(delay)
    }
    
    private func threeCardsAnimation(_ id: Int) -> Animation {
        let delay = Double(id) * DealConstants.totalThreeMoreCardsDealDuraction / 3
        return Animation.easeInOut(duration: DealConstants.dealDuration).delay(delay)
    }
    
    var newGame: some View {
        Button {
            viewModel.newGame()
            dealt = []
        } label: {
            Text("NewGame").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
        }
    }
    
    var gameBody: some View {
        AspectVGrid(viewModel.cardsInGame) { card in
            if isDealt(card) {
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .opacity))
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        withAnimation {
                            viewModel.chooseCard(card: card)
                        }
                    }
            }
        }
    }
    
    var deckBody: some View {
        ZStack {
            ForEach (viewModel.cardsInDeck + viewModel.cardsInGame.filter { !isDealt($0) }) { card in
                RoundedRectangle(cornerRadius: DealConstants.pileRadius)
                    .fill(CardConstants.frameColor)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .padding(4)
            }
        }
        .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight, alignment: .center)
        .padding()
        .onAppear {
            withAnimation(.easeInOut(duration: 4)) {
                self.viewModel.newGame()
            }

            for card in viewModel.cardsInGame {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
        .onTapGesture {
            withAnimation {
                viewModel.deal3Cards()
            }
            let cards = viewModel.cardsInGame.filter({ !isDealt($0) })
            for (card, id) in zip(cards, 0..<3) {
                withAnimation(threeCardsAnimation(id)) {
                    deal(card)
                }
            }
        }
    }
    
    var discardPile: some View {
        ZStack {
            ForEach (viewModel.discardPile) { card in
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .opacity))
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .frame(width: DealConstants.pileWidth, height: DealConstants.pileHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    
    private struct DealConstants {
        static let aspectRatio: CGFloat = 2/3
        static let pileHeight: CGFloat = 110
        static let pileWidth = pileHeight * aspectRatio
        static let pileRadius: CGFloat = 25
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let totalThreeMoreCardsDealDuraction: Double = 1
    }
}



struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetGameViewModel())
    }
}



