//
//  Wave.swift
//  setGameMac
//
//  Created by Kristina on 27.10.2021.
//

import Foundation
import SwiftUI

struct Wave : Shape {
    
    func path(in rect : CGRect) -> Path {
        
        let leftArcStart = CGPoint (x: rect.minX + rect.height/4, y: rect.maxY)
        let leftArcStop = CGPoint (x: rect.minX + 3 * rect.height/4, y: rect.minY)
        let rightArcStart = CGPoint (x: rect.maxX - rect.height/4, y: rect.minY)
        let rightArcStop = CGPoint (x: rect.maxX - 3 * rect.height/4, y: rect.maxY)
        
        var path = Path()
        
        path.move(to:leftArcStart)
        path.addCurve(to: leftArcStop, control1: CGPoint(x: rect.minX, y: rect.maxY), control2: CGPoint(x: rect.minX, y: rect.minY))
        path.addCurve(to: rightArcStart, control1: CGPoint(x: rect.midX + rect.height/4, y: rect.minY), control2: CGPoint(x: rect.midX+rect.height/4, y: rect.midY))
        path.addCurve(to: rightArcStop, control1: CGPoint(x: rect.maxX, y: rect.minY), control2: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addCurve(to: leftArcStart, control1: CGPoint(x: rect.midX-rect.height/2, y: rect.midY), control2: CGPoint(x: rect.midX-rect.height/2, y: rect.maxY))
        return path
    }
}
