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
    @IBOutlet weak var trailingConstrant: NSLayoutConstraint!
    @IBOutlet weak var leadingConstrant: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    
    var cardViewModel = CardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func flipCard(_ sender: Any) {
        
        if cardViewModel.isCardOpen() {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let destination = storyboard.instantiateViewController(withIdentifier: "mainBoard") as! MainScreenViewController

            destination.cardViewModel.setSelectedCollectionByName(collection: cardViewModel.getChosenCardCollection())
            
            let navEditorViewController: UINavigationController = UINavigationController(rootViewController: destination)
            
            present(navEditorViewController, animated: true, completion: nil)
            
        }
        cardViewModel.flipCardToDisplay()
    
        btnCard.setBackgroundImage(cardViewModel.getImageToDisplay(), for: .normal)
        
        btnCard.setImage(cardViewModel.getCardValueImageToDisplay(), for: .normal)
        
        btnCard.setTitle(cardViewModel.getTextToDisplay(), for: .normal)
        
        UIView.transition(with: btnCard, duration: cardViewModel.getDurationOfTransition(), options: cardViewModel.getMovementAnimation(), animations: nil, completion: nil)
    }
}

