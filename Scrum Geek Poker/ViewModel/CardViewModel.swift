//
//  CardViewModel.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 06/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit
import NotificationCenter

class CardViewModel: NSObject {
    
    var isOpen: Bool
    var image: UIImage
    var duration: Double
    
    override init() {
        self.isOpen = false
        self.image = UIImage(named: "back_card")!
        self.duration = 0.5
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

extension Notification.Name{
    static let FlipCardDidProcessToDisplay = NSNotification.Name("FlipCardDidProcessToDisplay")
}
