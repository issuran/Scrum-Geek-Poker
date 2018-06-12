//
//  MenuViewModel.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 07/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class MenuViewModel: NSObject {

    private var isOpen: Bool
    private var duration: Double
    private var trailingValue: CGFloat
    private var leadingValue: CGFloat
    private var shadowOpacityValue: Float
    private var shadowRadiusValue: CGFloat
    
    override init() {
        self.isOpen = false
        self.duration = 0.5
        self.trailingValue = 0
        self.leadingValue = 0
        self.shadowOpacityValue = 1
        self.shadowRadiusValue = 10
    }
    
    func displayMenu() {
        if isOpen{
            self.trailingValue = 0
            self.leadingValue = 0
        } else{
            self.trailingValue = -200
            self.leadingValue = 200
        }
        self.isOpen = !self.isOpen
    }
    
    func getTrailingValue() -> CGFloat {
        return self.trailingValue
    }
    
    func getLeadingValue() -> CGFloat {
        return self.leadingValue
    }
    
    func getDurationValue() -> Double {
        return self.duration
    }
    
    func getMenuShadowOpacityValue() -> Float {
        return self.shadowOpacityValue
    }
    
    func getMenuShadowRadiusValue() -> CGFloat {
        return self.shadowRadiusValue
    }
}
