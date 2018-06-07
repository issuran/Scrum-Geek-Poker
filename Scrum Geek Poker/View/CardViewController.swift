//
//  ViewController.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 06/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit
import NotificationCenter

class CardViewController: UIViewController {
    
    @IBOutlet weak var btnCard: UIButton!
    var isOpen = false
    var cardViewModel = CardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func flipCard(_ sender: Any) {
        
        cardViewModel.flipCardToDisplay()
    
        btnCard.setImage(cardViewModel.getImageToDisplay(), for: .normal)
        
        UIView.transition(with: btnCard, duration: cardViewModel.getDurationOfTransition(), options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
}

