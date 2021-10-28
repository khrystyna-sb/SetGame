//
//  Capsule.swift
//  setGameMac
//
//  Created by Kristina on 27.10.2021.
//

import Foundation
import SwiftUI


struct Capsule: Shape {
    
    func path(in rect : CGRect) -> Path { 
        
        let radius = rect.height/2
        let leftArcCenter = CGPoint (x: rect.minX + radius, y: rect.midY)
        let leftArcStart = CGPoint (x: leftArcCenter.x, y: rect.maxY)
        let rightArcCenter = CGPoint (x: rect.maxX - radius, y: rect.midY)
        let rightArcStart = CGPoint (x: rightArcCenter.x, y: rect.minY)
        
        var path = Path()
        
        path.addArc(center: leftArcCenter, radius: radius, startAngle: Angle.radians( Double.pi / 2),
                    endAngle: Angle.radians( 3 * Double.pi / 2), clockwise: false)
        path.addLine(to: rightArcStart)
        path.addArc(center: rightArcCenter, radius: radius, startAngle: Angle.radians(3 * Double.pi / 2), endAngle: Angle.radians(Double.pi/2), clockwise: false)
        path.addLine(to: leftArcStart)
        
        return path
    }
}
