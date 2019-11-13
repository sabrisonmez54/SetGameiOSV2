//
//  SetGameViewController.swift
//  SetGame
//
//  Created by Sabri Sönmez on 10/7/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class SetGameViewController: UIViewController
{

    @IBOutlet weak var newGameBtn: UIButton!
    @IBOutlet weak var dealMoreBtn: UIButton!
    
    var game = Set()
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var matchLabel: UILabel!
    
    @IBOutlet weak var cardContainerView: CardContainerView!
    
    
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //setBtns()
       
       
        updateViewFromModel()
        
    }
    

    
    func updateViewFromModel()
    {
       
        
        for view in self.cardContainerView.subviews {
            view.removeFromSuperview()
        }
        for index in game.cardsInGame.indices{
            let subView = SetCardView()
            subView.color = game.cardsInGame[index].color
            subView.count = game.cardsInGame[index].number
            subView.shade = game.cardsInGame[index].shade
            subView.shape = game.cardsInGame[index].shape
            subView.isMatched = game.cardsInGame[index].isMatched
            subView.isSelected = game.cardsInGame[index].isSelected
            subView.isMisMatched = game.cardsInGame[index].isMisMatched
            
            cardContainerView.addSubview(subView)
            
        }
        for view in self.cardContainerView.subviews {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(getIndex(_:)))
            view.addGestureRecognizer(gestureRecognizer)
        }
        
        scoreLabel.text = "Score: \(game.score)"
        matchLabel.isHidden = true
    }
    
   
  
    
    @objc func getIndex(_ sender: UITapGestureRecognizer) {
        if let cardNumber = cardContainerView.subviews.firstIndex(of: sender.view!)
        {
            game.chooseCard(at: cardNumber)
            let view = cardContainerView.subviews[cardNumber]
            view.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            view.layer.borderWidth = 2
           // print(cardNumber)
            
            if(game.cardsInGame[cardNumber].isMatched)
            {
                
                view.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                view.layer.borderWidth = 2
                self.matchLabel.isHidden = false
                self.matchLabel.text = "Match! +3"
                self.matchLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3, execute: {
                    
                    self.game.cardsInGame[cardNumber].isMatched = false
                    for i in 0..<self.game.cardsInGame.count{
                        self.game.cardsInGame[i].isSelected = false
                    }
                    self.updateViewFromModel()
                })
            }
            
            if(game.cardsInGame[cardNumber].isMisMatched){
                
                view.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                view.layer.borderWidth = 2
                self.matchLabel.isHidden = false
                self.matchLabel.text = "Mismatch! -1"
                self.matchLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    self.game.cardsInGame[cardNumber].isMisMatched = false
                    for i in 0..<self.game.cardsInGame.count{
                        self.game.cardsInGame[i].isSelected = false
                    }
                    self.updateViewFromModel()
                })
            }
        
        updateViewFromModel()
        }
    }
      
    
    @IBAction func newGameBtnClicked(_ sender: Any)
    {
        game.newGame()
        updateViewFromModel()
    }
    
    @IBAction func dealMoreBtnClicked(_ sender: Any)
    {
        for _ in 1...3{
            let randomIndex = Int.random(in: 0..<game.cardsInGame.count)
            game.cardsInGame.remove(at: randomIndex)
        }
        
        game.addCards(numberOfCardsToAdd: 3)
        
        updateViewFromModel()
        
        
        if game.cards.count <= 24
        {
            dealMoreBtn.isEnabled = false
        }
    }
    
}
