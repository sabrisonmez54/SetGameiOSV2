//
//  SetGameViewController.swift
//  SetGame
//
//  Created by Sabri Sönmez on 10/7/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class SetGameViewController: UIViewController {


    var game = Set()
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in cardButtons.indices
            {
                
                let button = cardButtons[index]
                let card = game.cards[index]
                button.setAttributedTitle(card.attributedContents(), for: .normal)
                button.layer.cornerRadius = 5.0
                button.layer.shadowColor = UIColor.black.cgColor
                button.layer.shadowOpacity = 0.2
                button.layer.shadowOffset = CGSize(width: 0, height: 1.0)
                button.layer.shadowRadius = 4.0
            }
        
    }
    
    @IBAction private func touchCard(_ sender: UIButton){
        
        if let cardNumber = cardButtons.firstIndex(of: sender)
        {
            game.chooseCard(at: cardNumber)
        }
        
    }
    
    
//    let button = cardButtons[cardNumber]
//    button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//    button.layer.borderWidth = 1
}
