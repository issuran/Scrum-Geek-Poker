//
//  CardViewModel.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 06/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class CardViewModel: NSObject {
    
    private var isOpen: Bool
    private var background: UIImage
    private var duration: Double
    private var movementAnimation: UIViewAnimationOptions
    private var chosenCard: Card
    private var cardValue: String
    private var cardValueImage: UIImage?
    private var cardImageBackgroundValue: String
    
    override init() {
        self.isOpen = false
        self.background = UIImage(named: "back_card")!
        self.cardValueImage = nil
        self.cardValue = ""
        self.cardImageBackgroundValue = "img_back"
        self.duration = 0.3
        self.movementAnimation = UIViewAnimationOptions.transitionFlipFromLeft
        self.chosenCard = Card()
    }
    
    func flipCardToDisplay() {
        if isOpen {
            
            self.background = UIImage(named: "back_card")!
            self.cardValue = ""
            self.cardValueImage = nil
            self.movementAnimation = UIViewAnimationOptions.transitionFlipFromLeft
            
        } else {
            
            if ( chosenCard.isImageCard ) {
                self.cardValue = ""
                self.cardValueImage = UIImage(named: chosenCard.valueImage)!
            } else {
                self.cardValue = chosenCard.value
                self.cardValueImage = nil
            }
            
            self.background = UIImage(named: chosenCard.backgroundImage)!            
            self.movementAnimation = UIViewAnimationOptions.transitionFlipFromRight
        }
        
        self.isOpen = !isOpen
    }
    
    func getImageToDisplay() -> UIImage {
        return background
    }
    
    func getCardValueImageToDisplay() -> UIImage? {
        return self.cardValueImage
    }
    
    func getTextToDisplay() -> String {
        return cardValue
    }
    
    func getDurationOfTransition() -> Double {
        return duration
    }
    
    func getMovementAnimation() -> UIViewAnimationOptions {
        return movementAnimation
    }
    
    func isCardOpen() -> Bool {
        return isOpen
    }
    
    func setCardToDisplay(card: Card) -> Void {
        self.cardValue = card.value
        self.cardImageBackgroundValue = card.backgroundImage
        self.chosenCard = card
    }
}
