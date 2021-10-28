//
//  Diamond.swift
//  setGameMac
//
//  Created by Kristina on 27.10.2021.
//

import Foundation
import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let halfWidth = (rect.width / 2 <= rect.height ? rect.width : rect.height * 2) / 2
        let halfHeight = halfWidth / 2
        
        var p = Path()
        p.move(to: CGPoint(x: center.x, y: center.y - halfHeight))
        p.addLine(to: CGPoint(x: center.x + halfWidth, y: center.y))
        p.addLine(to: CGPoint(x: center.x, y: center.y + halfHeight))
        p.addLine(to: CGPoint(x: center.x - halfWidth, y: center.y))
        p.addLine(to: CGPoint(x: center.x, y: center.y - halfHeight))
        return p
    }
}
