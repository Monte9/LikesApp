
//
//  HomeViewController.swift
//  Likes
//
//  Created by Monte's Pro 13" on 3/30/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit
import RESideMenu
import Alamofire
import Ono
import AFNetworking

var i = 1

class HomeViewController: UIViewController, NSXMLParserDelegate {
    
    @IBOutlet weak var cardsView: DraggableImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var dislikeButton: UIButton!
    
    @IBOutlet weak var redoButton: UIButton!
    
    var cards: [Card] = []
    
    var likedCards: [Card] = []
    var dislikedCards: [Card] = []
    
    var defaultCard = Card(dictionary: NSDictionary.init(dictionary: ["name": "End of list. Please click referesh below", "imageName": "mars"]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup the logo for titleView in the navigation bar
        let logoImage = UIImage(named: "logo")
        self.navigationItem.titleView = UIImageView(image: logoImage)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.showNewCard), name: userDidAnswer, object: nil)
        
        print("Calling API now...")
        Card.searchWithTerm("Pizza", latitude: 37.721839, longitude: -122.476927, sort: .BestMatched, categories: [], deals: false, offset: nil, limit: 20) { (cards: [Card]!, error: NSError!) -> Void in

            if (error == nil) {
                self.cards = cards
                self.cardsView.setCard(cards.first)
            }
            else {
                print("No data returned with error: \(error.localizedDescription)")
            }
        }
        
    }
    
    func showNewCard() {
        if cardsView.currentCard?.liked == true && i < cards.count  {
            likedCards.append(cardsView.currentCard!)
            cardsView.setCard(cards[i])
            cardsView.numberYes = cardsView.numberYes + 1
        } else if i < cards.count {
            dislikedCards.append(cardsView.currentCard!)
            cardsView.setCard(cards[i])
            cardsView.numberNo = cardsView.numberNo + 1
        } else if i == cards.count {
            if cardsView.currentCard?.liked == true {
                cardsView.numberYes = cardsView.numberYes + 1
                cardsView.setCard(defaultCard)
            } else {
                cardsView.numberNo = cardsView.numberNo + 1
                cardsView.setCard(defaultCard)
            }
        }
        i += 1
    }
    
    @IBAction func goGoGorilla(sender: AnyObject) {
        i = 1
        cardsView.numberYes = 0
        cardsView.numberNo = 0
        cardsView.setCard(cards.first)
    }
    
    @IBAction func cardLiked(sender: AnyObject) {
        if i < cards.count {
            likedCards.append(cardsView.currentCard!)
            cardsView.setCard(cards[i])
            cardsView.numberYes = cardsView.numberYes + 1
        } else if i == cards.count {
            cardsView.numberYes = cardsView.numberYes + 1
            cardsView.setCard(defaultCard)
        }
        i += 1
    }

    @IBAction func cardDisliked(sender: AnyObject) {
        if i < cards.count {
            dislikedCards.append(cardsView.currentCard!)
            cardsView.setCard(cards[i])
            cardsView.numberNo = cardsView.numberNo + 1
        } else if i == cards.count {
            cardsView.numberNo = cardsView.numberNo + 1
            cardsView.setCard(defaultCard)
        }
        i += 1
    }
    
    @IBAction func settingsClicked(sender: AnyObject) {
        self.presentLeftMenuViewController(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let likedCardsController = segue.destinationViewController as! LikedCardsViewController
        likedCardsController.likedCards = self.likedCards
    }

}
