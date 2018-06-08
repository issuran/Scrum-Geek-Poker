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
    
    override init() {
        self.isOpen = false
        self.image = UIImage(named: "back_card")!
        self.duration = 0.3
    }
    
    func flipCardToDisplay() {
        if isOpen{
            self.isOpen = false
            self.image = UIImage(named: "back_card")!
        } else{
            self.isOpen = true
            self.image = UIImage(named: "front_card")!
        }
    }
    
    func getImageToDisplay() -> UIImage{
        return image
    }
    
    func getDurationOfTransition() -> Double{
        return duration
    }
}
