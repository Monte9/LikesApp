
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

var i = 1

class HomeViewController: UIViewController, NSXMLParserDelegate {
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var cardsView: DraggableImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var dislikeButton: UIButton!
    
    @IBOutlet weak var redoButton: UIButton!
    
    
    //properties for XML parsing
    var xmlParser: NSXMLParser = NSXMLParser()
    var arrNeighboursData: NSMutableArray = []
    var dictTempDataStorage: NSMutableDictionary = [:]
    var foundValue: NSMutableString = ""
    var currentElement: NSString = ""
    
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
        
        print("Calling API now...")
        makeAPICall()
        
    }
    
    func makeAPICall() {
        
        Alamofire.request(.GET, "http://api.geonames.org/neighbours", parameters: ["geonameId": "2658434", "username": "demo"]).responseData({ (response) in
            
            if let data = response.result.value {
                print("Found data")
                
                self.xmlParser = NSXMLParser(data: data)
                self.xmlParser.delegate = self
                
                // Initialize the mutable string that we'll use during parsing.
                self.foundValue = NSMutableString()
                
                print("Starting parsing of XML data received from API")
                
                // Start parsing.
                self.xmlParser.parse()
                
            }
            
        })
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
    
    @IBAction func settingsClicked(sender: AnyObject) {
        self.presentLeftMenuViewController(self)
    }
    
    //Implemented NSXMLParserDelegate methods
    
    func parserDidStartDocument(parser: NSXMLParser) {
        // Initialize the neighbours data array.
        self.arrNeighboursData = NSMutableArray()
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        print("Parsing XML complete.. info stored in a array of dictionaries ready for consuption. ;)")
        print("The final data is like this:")
        print(arrNeighboursData)
        print("Index 4")
        print(arrNeighboursData[4].objectForKey("toponymName"))
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print("MSXML parsing error: \(parseError.localizedDescription)")
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        // If the current element name is equal to "geoname" then initialize the temporary dictionary.
        if elementName == "geoname" {
            self.dictTempDataStorage = [:]
        }
        
        // Keep the current element.
        self.currentElement = elementName;

    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        // If the closing element equals to "geoname" then the all the data of a neighbour country has been parsed and the dictionary should be added to the neighbours data array.
        if elementName == "geoname" {
            self.arrNeighboursData.addObject(NSDictionary.init(dictionary: self.dictTempDataStorage))
        } else if elementName == "name" {
            self.dictTempDataStorage.setObject(NSString(string: self.foundValue), forKey: "name")
        } else if elementName == "toponymName" {
           // If the toponym name element was found then store it.
            self.dictTempDataStorage.setObject(NSString(string: self.foundValue), forKey: "toponymName")
        }
        
        // Clear the mutable string.
        self.foundValue.setString("")
        
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        // Store the found characters if only we're interested in the current element.
        if self.currentElement == "name" || self.currentElement == "toponymName"{
            if !(string == "\n") {
                self.foundValue.appendString(string)
            }
        }
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
