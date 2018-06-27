//
//  MainScreenCollectionViewCell.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 25/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class MainScreenCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cardValue: UILabel!
    @IBOutlet weak var cardImgBackground: UIImageView!
    @IBOutlet weak var cardImageValue: UIImageView!
    
    func displayContent(image: UIImage, title: String, cardImage: String){
        cardImgBackground.image = image
        if cardImage == "" {
            cardValue.text = title
        } else {
            cardImageValue.image = UIImage(named: cardImage)
        }        
    }
    
}
