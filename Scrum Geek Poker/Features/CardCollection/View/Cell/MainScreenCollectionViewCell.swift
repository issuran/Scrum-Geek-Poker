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
    
    func displayContent(image: UIImage, title: String){
        cardValue.text = title
        cardImgBackground.image = image
    }
    
}
