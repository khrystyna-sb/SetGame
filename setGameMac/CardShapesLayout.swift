//
//  CardShapesLayout.swift
//  setGameMac
//
//  Created by Kristina on 27.10.2021.
//

import Foundation
import SwiftUI

struct CardShapesLayout : ViewModifier { 
    
    var size : CGSize
    var color : Color
    
    let elementWidthToCardWidth = CGFloat(3.0 / 4.0)
    let elementHeightToCardHeight = CGFloat(1.3 / 6.0)
    let spacingWidthToCardWidth  = CGFloat(0.5 / 4.0)
    
    func body(content: Content ) -> some View {
        HStack {
            Spacer(minLength : size.width * spacingWidthToCardWidth)
            content
                .frame(width: size.width * elementWidthToCardWidth,
                       height: size.height * elementHeightToCardHeight, alignment: .center)
                .foregroundColor(color)
            Spacer(minLength : size.width * spacingWidthToCardWidth)
        }
    }
}
