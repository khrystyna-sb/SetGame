//
//  TypeExtentions.swift
//  setGameMac
//
//  Created by Kristina on 27.10.2021.
//

import Foundation
import SwiftUI

extension Array where Element : Identifiable {
     func firstIndex(matching element: Element) -> Int? {
         return self.firstIndex{$0.id == element.id}
     }
 }

extension View {
    func cardShapesLayout(size : CGSize, color: Color) -> some View {
        return self.modifier(CardShapesLayout(size : size, color: color))
    }
}



