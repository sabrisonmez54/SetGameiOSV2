//
//  ViewController.swift
//  SetGame
//
//  Created by Sabri Sönmez on 9/23/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startGameBtn: UIButton!
    @IBOutlet weak var howToPlayBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGameBtn.layer.cornerRadius = 10.0
        startGameBtn.layer.shadowColor = UIColor.black.cgColor
        startGameBtn.layer.shadowOpacity = 0.2
        startGameBtn.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        startGameBtn.layer.shadowRadius = 4.0
        
        howToPlayBtn.layer.cornerRadius = 10.0
        howToPlayBtn.layer.shadowColor = UIColor.black.cgColor
        howToPlayBtn.layer.shadowOpacity = 0.5
        howToPlayBtn.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        howToPlayBtn.layer.shadowRadius = 4.0
    }

    
}

