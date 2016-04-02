//
//  Card.swift
//  Likes
//
//  Created by Monte's Pro 13" on 3/30/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class Card: NSObject {
    
    var imageName: String?
    let imageURL: NSURL?
    var caption: String?
    var liked: Bool?
    
    static var index = 0
    
    init(dictionary: NSDictionary) {
        self.caption = dictionary["name"] as? String
        
        if let imageNameString = dictionary["imageName"] as? String
        {
           self.imageName = imageNameString
        } else {
            self.imageName = nil
        }
        
        if let imageURLString = dictionary["image_url"] as? String {
            let newURL = imageURLString.stringByReplacingOccurrencesOfString("ms.jpg", withString: "348s.jpg")
            self.imageURL = NSURL(string: newURL)!
        } else {
            imageURL = nil
        }
    }
    
    class func cards(array array: [NSDictionary]) -> [Card] {
        var cards = [Card]()
        for dictionary in array {
            let card = Card(dictionary: dictionary)
            cards.append(card)
        }
        return cards
    }
    
    class func searchWithTerm(term: String, latitude: NSNumber?, longitude: NSNumber?,  sort: YelpSortMode?, categories: [String]?, deals: Bool?, offset: Int?, limit: Int?, completion: ([Card]!, error: NSError!) -> Void) -> Void {
        YelpClient.sharedInstance.searchWithTerm(term, latitude: latitude, longitude: longitude, sort: sort, categories: categories, deals: deals, offset: offset, limit: limit, completion: completion)
    }
    
}
