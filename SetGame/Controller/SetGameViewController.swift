//
//  SetGameViewController.swift
//  SetGame
//
//  Created by Sabri Sönmez on 10/7/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class SetGameViewController: UIViewController {

    @IBOutlet weak var newGameBtn: UIButton!
    @IBOutlet weak var dealMoreBtn: UIButton!
    
    var game = Set()
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtns()
    }
    
    func updateViewFromModel() {
       
        scoreLabel.text = "Score: \(game.score)"
    }
    
    func setBtns(){
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cardsInGame[index]
            button.setAttributedTitle(card.attributedContents(), for: .normal)
            button.layer.cornerRadius = 5.0
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.2
            button.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            button.layer.shadowRadius = 4.0
            button.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton){
        
        if let cardNumber = cardButtons.firstIndex(of: sender)
        {

            
            game.chooseCard(at: cardNumber)
            
            let button = cardButtons[cardNumber]

                button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                button.layer.borderWidth = 2
                
            if(game.cardsInGame[cardNumber].isMatched){
                
                                    button.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                                    button.layer.borderWidth = 2
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    self.setBtns()
                    self.game.cardsInGame[cardNumber].isMatched = false
                    for i in 0..<self.game.cardsInGame.count{
                        self.game.cardsInGame[i].isSelected = false
                    }
                })
                
            }
            if(game.cardsInGame[cardNumber].isMisMatched){
                
                    button.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                    button.layer.borderWidth = 2
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    self.setBtns()
                    self.game.cardsInGame[cardNumber].isMisMatched = false
                    for i in 0..<self.game.cardsInGame.count{
                        self.game.cardsInGame[i].isSelected = false
                    }
                })
            }
        }
        updateViewFromModel()
    }
    
    @IBAction func newGameBtnClicked(_ sender: Any) {
        game.newGame()
        setBtns()
        updateViewFromModel()
    }
    @IBAction func dealMoreBtnClicked(_ sender: Any) {
        for _ in 1...3{
            let randomIndex = Int.random(in: 0..<game.cardsInGame.count)
            game.cardsInGame.remove(at: randomIndex)
        }
        
        game.addCards(numberOfCardsToAdd: 3)
        
        updateViewFromModel()
        setBtns()
        if game.cards.count <= 24 {
            dealMoreBtn.isEnabled = false
        }
       
    }
   
}
