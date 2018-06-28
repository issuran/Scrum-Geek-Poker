//
//  CardsViewModel.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 11/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

enum CardsCollectionChosen: String {
    case fibonacci = "Fibonacci"
    case shirt = "T-shirt"
    case none = "none"
    
    static let cardCollectionValues = [fibonacci, shirt, none]
}

class CardsViewModel: NSObject {
    private var numberOfItemsInSection: Int
    private var numberOfSections: Int
    private var cardsCollection: Array<String>
    private var cardsCollectionType: CardsCollectionChosen
    private var cardCellHeightValue: CGFloat
    private var image: UIImage
    private var bottomMenuVisibility: Bool
    private var imageUri: String
    
    override init() {
        
        self.numberOfItemsInSection = 1
        self.numberOfSections = 1
        self.cardsCollectionType = .fibonacci
        self.cardsCollection = Array<String>()
        self.cardCellHeightValue = 150
        self.imageUri = "img_back"
        self.image = UIImage(named: "img_back")!
        self.bottomMenuVisibility = true
        super.init()
        
        updateCardsCollection()
    }
    
    func updateCardsCollection() -> Void {
        switch cardsCollectionType {
        case .fibonacci:
            self.cardsCollectionType = .fibonacci
            self.cardsCollection = ["1", "2", "3", "5", "8", "13", "21", "34", "55", "89", "infinity", "?", "coffee"]
            
        case .shirt:
            self.cardsCollectionType = .shirt
            self.cardsCollection = ["XS", "S", "M", "L", "XL", "XXL", "XXXL", "infinity", "?", "coffee"]
            
        default:
            self.cardsCollectionType = .none
        }
        
        self.numberOfItemsInSection = cardsCollection.count
        
    }
    
    // Amount of items per section - each section gonna have
    func getNumberOfItemsInSection() -> Int {
        return self.numberOfItemsInSection
    }
    
    // Amount of sections - I want `n` sections (rows)
    func getNumberOfSections() -> Int {
        return self.numberOfSections
    }
    
    func getCardCellHeightValue() -> CGFloat {
        return self.cardCellHeightValue
    }
    
    func setCardCellHeightValue(height: CGFloat) -> Void {
        self.cardCellHeightValue = height
    }
    
    func getCardByIndex(position: Int) -> Card {
        var cardValueImage = ""
        let cardValue = self.cardsCollection[position]
        
        switch cardValue {
            case "infinity":
                cardValueImage = "infinity"
            case "coffee":
                cardValueImage = "coffee"
            default:
                cardValueImage = ""
        }
        
        return Card(
            cardValue: cardValue,
            cardImageBackground: self.imageUri,
            cardValueImage: cardValueImage,
            isImageCard: cardValueImage == "" ? false : true,
            typeCollection: getCollectionSelected())
    }
    
    func getImageBackground() -> UIImage {
        return image
    }
    
    func getCollectionSelected() -> String {
        switch self.cardsCollectionType {
        case .fibonacci:
            return "Fibonacci"
            
        case .shirt:
            return "T-Shirt"
            
        case .none:
            return "Fibonacci"
        }
    }
    
    func getBottomMenuVisibility() -> Bool {
        return self.bottomMenuVisibility
    }
    
    func setBottomMenuVisibility() -> Void {
        self.bottomMenuVisibility = !self.bottomMenuVisibility
    }
    
    func setSelectedCollection(position: Int) -> Void {
        switch CardsCollectionChosen.cardCollectionValues[position].rawValue {
        case "Fibonacci":
            self.cardsCollectionType = .fibonacci
        case "T-shirt":
            self.cardsCollectionType = .shirt
        default:
            self.cardsCollectionType = .none
        }
        
        updateCardsCollection()
    }
    
    func setSelectedCollectionByName(collection: String) -> Void {
        switch collection {
        case "Fibonacci":
            self.cardsCollectionType = .fibonacci
        case "T-shirt":
            self.cardsCollectionType = .shirt
        default:
            self.cardsCollectionType = .none
        }
        
        updateCardsCollection()
    }
}
