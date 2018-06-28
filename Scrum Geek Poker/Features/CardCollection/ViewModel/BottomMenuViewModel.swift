//
//  BottomMenuViewModel.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 27/06/2018.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import Foundation
import UIKit


class BottomMenuViewModel: NSObject {
    private var numberOfItemsInSection: Int
    private var numberOfSections: Int
    private var menuItemCollection: Array<String>
    private var menuItemImageCollection: Array<String>
    
    override init() {
        self.numberOfItemsInSection = 1
        self.numberOfSections = 1
        self.menuItemCollection = ["Fibonacci", "T-Shirt"]
        self.menuItemImageCollection = ["fibonacci", "tshirt"]
        super.init()
    }
    
    func getTitleItemMenu(position: Int) -> String {
        return menuItemCollection[position]
    }
    
    func getImageItemMenu(position: Int) -> UIImage {
        return UIImage(named: menuItemImageCollection[position])!
    }
    
    func getNumberOfItemsInSection() -> Int {
        return menuItemCollection.count
    }
}
