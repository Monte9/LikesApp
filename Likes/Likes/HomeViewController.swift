
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
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var dislikeButton: UIButton!
    
    @IBOutlet weak var redoButton: UIButton!
    
    var cards: [Card] = []
    
    var likedCards: [Card] = []
    var dislikedCards: [Card] = []
    
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
            likedCards.append(cardsView.currentCard!)
            cardsView.setCard(cards[i])
            cardsView.numberYes = cardsView.numberYes + 1
        } else if i < 4 {
            dislikedCards.append(cardsView.currentCard!)
            cardsView.setCard(cards[i])
            cardsView.numberNo = cardsView.numberNo + 1
        } else if i == 4 {
            if cardsView.currentCard?.liked == true {
                i = 0
                likedCards.append(cardsView.currentCard!)
                cardsView.setCard(cards[i])
                cardsView.numberYes = cardsView.numberYes + 1
            } else {
                i = 0
                dislikedCards.append(cardsView.currentCard!)
                cardsView.setCard(cards[i])
                cardsView.numberNo = cardsView.numberNo + 1
            }
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
    
    
    @IBAction func cardLiked(sender: AnyObject) {
        if i < 4 {
            likedCards.append(cardsView.currentCard!)
            cardsView.setCard(cards[i])
            cardsView.numberYes = cardsView.numberYes + 1
        } else if i == 4 {
            i = 0
            likedCards.append(cardsView.currentCard!)
            cardsView.setCard(cards[i])
            cardsView.numberYes = cardsView.numberYes + 1
        }
        i += 1
    }

    @IBAction func cardDisliked(sender: AnyObject) {
        if i < 4 {
            dislikedCards.append(cardsView.currentCard!)
            cardsView.setCard(cards[i])
            cardsView.numberNo = cardsView.numberNo + 1
        } else if i == 4 {
            i = 0
            dislikedCards.append(cardsView.currentCard!)
            cardsView.setCard(cards[i])
            cardsView.numberNo = cardsView.numberNo + 1
        }
        i += 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let likedCardsController = segue.destinationViewController as! LikedCardsViewController
        likedCardsController.likedCards = self.likedCards
    }
    
}
