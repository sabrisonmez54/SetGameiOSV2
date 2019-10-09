//
//  Set.swift
//  SetGame
//
//  Created by Sabri Sönmez on 10/7/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import Foundation

struct Set {
    
    private(set) var cards = [Card]()
    
    mutating func draw() -> Card? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
    
    
    init() {
        for color in Card.Colors.all {
            for shape in Card.Shapes.all{
                for shade in Card.Shades.all {
                    let playingCard = Card(color: color, shade: shade, shape: shape, count: 12, isMatched: false, isMisMatcehd: false, isSelected: false)
                    cards.append(playingCard)
                    cards.shuffle()
                }
            }
        }
    }

}

extension Int {
    var arc4random: Int {
        if (self > 0) {
            return Int(arc4random_uniform(UInt32(self)))
        } else if (self < 0) {
            return -Int(arc4random_uniform(UInt32(-self)))
        } else {
            return 0
        }
    }
}

