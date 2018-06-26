//
//  MainScreenViewController.swift
//  Scrum Geek Poker
//
//  Created by Tiago Oliveira on 25/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

// TODO 1 : REFATORAR PARA PADRONIZAR MVVM

class MainScreenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var cardViewModel = CardsViewModel()
    
    @IBOutlet weak var titleCollection: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomMenu: UIButton!
    @IBOutlet weak var bottomMenuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleCollection.text = cardViewModel.getCollectionSelected()
        
        self.bottomMenuView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardViewModel.getNumberOfItemsInSection()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! MainScreenCollectionViewCell
        
        let cardValue = cardViewModel.getCardByIndex(position: indexPath.row)
        
        cell.displayContent(image: cardViewModel.getImageBackground(), title: cardValue)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // TODO 2 : PASSAR QUAL CARTA FOI SELECIONADA
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "cardToDisplay") as! CardViewController
        present(destination, animated: true, completion: nil)

    }
    
    @IBAction func showBottomMenu(_ sender: Any) {
        if self.bottomMenuView.isHidden {
                [UIView .transition(with: bottomMenuView, duration: 0.5, options: .transitionCurlDown, animations: {self.bottomMenuView.isHidden = false}, completion: nil)]
        }
        else {
            [UIView .transition(with: bottomMenuView, duration: 0.5, options: .transitionCurlUp, animations: {self.bottomMenuView.isHidden = true}, completion: nil)]
        }
        
    }
    
}
