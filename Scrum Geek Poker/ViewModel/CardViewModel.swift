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
    private var image: UIImage
    private var duration: Double
    private var movementAnimation: UIViewAnimationOptions
    
    override init() {
        self.isOpen = false
        self.image = UIImage(named: "back_card")!
        self.duration = 0.3
        self.movementAnimation = UIViewAnimationOptions.transitionFlipFromLeft
    }
    
    func flipCardToDisplay() {
        if isOpen {
            self.image = UIImage(named: "back_card")!
            self.movementAnimation = UIViewAnimationOptions.transitionFlipFromLeft
        } else {
            self.image = UIImage(named: "front_card")!
            self.movementAnimation = UIViewAnimationOptions.transitionFlipFromRight
        }
        
        self.isOpen = !isOpen
    }
    
    func getImageToDisplay() -> UIImage {
        return image
    }
    
    func getDurationOfTransition() -> Double {
        return duration
    }
    
    func getMovementAnimation() -> UIViewAnimationOptions {
        return movementAnimation
    }
}
