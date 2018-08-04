//
//  MainScreenViewController.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 25/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var cardViewModel = CardsViewModel()
    var menuViewModel = BottomMenuViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomMenu: UIButton!
    @IBOutlet weak var bottomMenuView: UIView!
    @IBOutlet weak var bottomMenuCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
    }

    func loadData() -> Void {
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = cardViewModel.getCollectionSelected()
        
        self.bottomMenuView.isHidden = cardViewModel.getBottomMenuVisibility()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return cardViewModel.getNumberOfItemsInSection()
        } else if collectionView == self.bottomMenuCollectionView {
            return menuViewModel.getNumberOfItemsInSection()
        }
        
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! MainScreenCollectionViewCell
            
            let card = cardViewModel.getCardByIndex(position: indexPath.row)
            
            cell.displayContent(image: cardViewModel.getImageBackground(), title: card.value, cardImage: card.valueImage)
            
            return cell
        }
        
        else if collectionView == self.bottomMenuCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomMenuCollectionViewCell", for: indexPath) as! BottomMenuCollectionViewCell
            
            cell.displayContent(image: menuViewModel
                .getImageItemMenu(position: indexPath.row), title: menuViewModel.getTitleItemMenu(position: indexPath.row))
            
            return cell
        }
        
        return UICollectionViewCell.init()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.collectionView {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let destination = storyboard.instantiateViewController(withIdentifier: "cardToDisplay") as! CardViewController
            
            destination.cardViewModel.setCardToDisplay(card: cardViewModel.getCardByIndex(position: indexPath.row))
            
            present(destination, animated: true, completion: nil)

        } else if collectionView == self.bottomMenuCollectionView {
            _ = [UIView .transition(
                with: bottomMenuView,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: {
                    self.bottomMenuView.isHidden = true
            },
                completion: nil)]
            
            cardViewModel.setSelectedCollection(position: indexPath.row)
            
            reloadCards()
            
            cardViewModel.setBottomMenuVisibility()
        }
    }
    
    func reloadCards() {
        collectionView.reloadData()
        
        self.title = cardViewModel.getCollectionSelected()
    }
    
    @IBAction func showBottomMenu(_ sender: Any) {
        if cardViewModel.getBottomMenuVisibility() {
                _ = [UIView .transition(
                    with: bottomMenuView,
                    duration: 0.3,
                    options: .transitionCrossDissolve,
                    animations: {
                        self.bottomMenuView.isHidden = false
                        
                        // Turn UIButton upside down
                        self.bottomMenu.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                },
                    completion: nil)]
        }
        else {
            _ = [UIView .transition(
                with: bottomMenuView,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: {
                    self.bottomMenuView.isHidden = true
                    
                    // Turn UIButton back to normal
                    self.bottomMenu.transform = CGAffineTransform(rotationAngle: 0)
            },
                completion: nil)]
        }
        
        cardViewModel.setBottomMenuVisibility()
        
    }
    
}
