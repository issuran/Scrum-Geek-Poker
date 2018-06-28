//
//  BottomMenuCollectionViewCell.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 27/06/2018.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class BottomMenuCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var menuItemImg: UIImageView!
    @IBOutlet weak var menuItemTitle: UILabel!
    
    func displayContent(image: UIImage, title: String){
        self.menuItemImg.image = image
        self.menuItemTitle.text = title
    }
    
}
