//
//  ViewController.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 06/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit
import NotificationCenter

// TODO 3 : RECEBER VALOR DA CARTA SELECIONADA

class CardViewController: UIViewController {
    
    @IBOutlet weak var btnCard: UIButton!
    @IBOutlet weak var trailingConstrant: NSLayoutConstraint!
    @IBOutlet weak var leadingConstrant: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    
    var cardViewModel = CardViewModel()
    var menuViewModel = MenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.shadowOpacity = menuViewModel.getMenuShadowOpacityValue()
        mainView.layer.shadowRadius = menuViewModel.getMenuShadowRadiusValue()
        
        trailingConstrant.constant = menuViewModel.getTrailingValue()
        leadingConstrant.constant = menuViewModel.getLeadingValue()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        trailingConstrant.constant = menuViewModel.getTrailingValue()
        leadingConstrant.constant = menuViewModel.getLeadingValue()
    }
    
    @IBAction func flipCard(_ sender: Any) {
        
        cardViewModel.flipCardToDisplay()
    
        btnCard.setImage(cardViewModel.getImageToDisplay(), for: .normal)
        
        UIView.transition(with: btnCard, duration: cardViewModel.getDurationOfTransition(), options: cardViewModel.getMovementAnimation(), animations: nil, completion: nil)
    }
    
    @IBAction func openMenu(_ sender: Any) {
        
        menuViewModel.displayMenu()
        
        trailingConstrant.constant = menuViewModel.getTrailingValue()
        leadingConstrant.constant = menuViewModel.getLeadingValue()
        
        UIView.animate(withDuration: menuViewModel.getDurationValue(), animations: {
            self.view.layoutIfNeeded()
            
        })
    }
}

