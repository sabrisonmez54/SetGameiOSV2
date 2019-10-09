//
//  Card.swift
//  SetGame
//
//  Created by Sabri Sönmez on 10/7/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import Foundation
import UIKit

struct Card
{
    internal var color : Colors
    internal var shade : Shades
    internal var shape : Shapes
    internal var count : Int
    
    internal var isMatched = false
    internal var isMisMatcehd = false
    internal var isSelected = false
    
    var description: String {
        return "\(color)\(shade),\(shape)"
    }
    
    enum Colors
    {
        case purple
        case green
        case red
        static var all = [Colors.purple, Colors.green, Colors.red]
    }
    
    enum Shades
    {
        case empty
        case filled
        case striped
        static var all = [Shades.empty, Shades.filled, Shades.striped]
    }
    
    enum Shapes
    {
        case triangle
        case circle
        case square
        static var all = [Shapes.triangle, Shapes.circle, Shapes.square]
    }
    
    func cardFace() -> String
    {
    var shape : String
        
    switch(self.shape)
    {
    case .triangle:
        shape = "▲"
    case .circle:
        shape = "⬤"
    case .square:
        shape = "■"
        }
    return shape
        
    }
    
    func attributedContents() -> NSAttributedString {
        
        var strokeColor : UIColor
        
        switch (self.color) {
        case .purple:
            strokeColor = UIColor.purple
        case .green:
            strokeColor = UIColor.green
        case .red:
            strokeColor = UIColor.red
        }
        
        var shadingColor = strokeColor
        
        switch (self.shade) {
        case .empty:
            shadingColor = shadingColor.withAlphaComponent(0.0)
        case .striped:
            shadingColor = shadingColor.withAlphaComponent(0.2)
        case .filled:
            shadingColor = shadingColor.withAlphaComponent(1.0)
        }
        
        let attributes : [NSAttributedString.Key: Any] = [.strokeColor : strokeColor, .foregroundColor : shadingColor, .strokeWidth : -5.0 ]
        
        let attribtext = NSAttributedString(string: self.cardFace(), attributes: attributes)
        
        return attribtext
    }
    
}
