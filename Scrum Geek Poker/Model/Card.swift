//
//  Card.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 26/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import Foundation

struct Card {
    let value: String
    let valueImage: String
    let backgroundImage: String
    let isImageCard: Bool
    
    init(cardValue: String, cardImageBackground: String, cardValueImage: String, isImageCard: Bool) {
        self.value = cardValue
        self.backgroundImage = cardImageBackground
        self.valueImage = cardValueImage
        self.isImageCard = isImageCard
    }
    
    init() {
        self.value = "0"
        self.backgroundImage = "img_back"
        self.valueImage = ""
        self.isImageCard = false
    }
}
