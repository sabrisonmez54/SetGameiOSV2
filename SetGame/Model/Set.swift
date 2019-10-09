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
    private(set) var selectedTrio = [Card]()

    
    internal mutating func chooseCard(at index: Int)
    {assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): Chosen index not valid")
        if !cards[index].isMatched{
            
            self.selectedTrio.append(cards[index])
            if(checkMatch(cards)){
                selectedTrio.removeAll()
                print("MATCH")
            }else{
                print("mismatch")
            }
            
        }
      
     
        
        
    
    }
    
    private func checkMatch(_ cards : [Card]) -> Bool {
        if(selectedTrio.count == 3){
            let first = cards[0]
            let second = cards[1]
            let third = cards[2]
            
            let numbersFeatures = [first.number, second.number, third.number]
            let colorsFeatures = [first.color, second.color, third.color]
            let symbolsFeatures = [first.shape, second.shape, third.shape]
            let shadingsFeatures = [first.shade, second.shade, third.shade]
            
            return (numbersFeatures.count == 1 || numbersFeatures.count == 3) &&
                (colorsFeatures.count == 1 || colorsFeatures.count == 3) &&
                (symbolsFeatures.count == 1 || symbolsFeatures.count == 3) &&
                (shadingsFeatures.count == 1 || shadingsFeatures.count == 3)
        }else{
            return false
        }
        
    }

    init() {
        for color in Card.Colors.all {
            for shape in Card.Shapes.all{
                for number in Card.Numbers.all{
                    for shade in Card.Shades.all {
                        let playingCard = Card(color: color, shade: shade, shape: shape, number: number, isMatched: false, isMisMatcehd: false, isSelected: false)
                        cards.append(playingCard)
                        cards.shuffle()
                    }
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

