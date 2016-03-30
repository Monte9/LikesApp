
//
//  HomeViewController.swift
//  Likes
//
//  Created by Monte's Pro 13" on 3/30/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

var i = 1

class HomeViewController: UIViewController {
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var cardsView: DraggableImageView!
    
    var cards: [Card] = []
    
    let dict = ["ImageName" : "bernie", "Caption": "Do you #FeelTheBern?"]
    let dict2 = ["ImageName" : "mars", "Caption": "Do you want to live on Mars?"]
    let dict3 = ["ImageName" : "modelX", "Caption": "Is this the car of the future?"]
    let dict4 = ["ImageName" : "yosemite", "Caption": "Have you been to Yosemite?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup the logo for titleView in the navigation bar
        let logoImage = UIImage(named: "logo")
        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        resultsLabel.hidden = true

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.showNewUser), name: userDidAnswer, object: nil)
        
        let bernieCard = Card.init(dictionary: dict)
        self.cards.append(bernieCard)
        
        let marsCard = Card.init(dictionary: dict2)
        self.cards.append(marsCard)
        
        let modelXCard = Card.init(dictionary: dict3)
        self.cards.append(modelXCard)
        
        let yosemiteCard = Card.init(dictionary: dict4)
        self.cards.append(yosemiteCard)
        
        cardsView.setCard(cards.first)
                
        print("Number of cards: \(cards.count)")
    }
    
    func showNewUser() {
        
        if cardsView.currentCard?.liked == true && i < 4  {
            cardsView.setCard(cards[i])
            cardsView.numberYes = cardsView.numberYes + 1
        } else if i < 4 {
            cardsView.setCard(cards[i])
            cardsView.numberNo = cardsView.numberNo + 1
        } else if i == 4 {
            if cardsView.currentCard?.liked == true {
                cardsView.numberYes = cardsView.numberYes + 1
            } else {
                cardsView.numberNo = cardsView.numberNo + 1
            }
            resultsLabel.text = "Yes: \(cardsView.numberYes) | No: \(cardsView.numberNo)"
            resultsLabel.hidden = false
            cardsView.hidden = true
            i = -1
        }
        i += 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goGoGorilla(sender: AnyObject) {
        i = 0
        resultsLabel.hidden = true
        cardsView.hidden = false
        cardsView.numberYes = 0
        cardsView.numberNo = 0
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
