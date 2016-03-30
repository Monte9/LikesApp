//
//  Card.swift
//  Likes
//
//  Created by Monte's Pro 13" on 3/30/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class Card: NSObject {
    
    var imageName: String
    var caption: String
    var liked: Bool?
    
    static var index = 0
    
    init(dictionary: NSDictionary) {
        self.imageName = (dictionary["ImageName"] as! String)
        self.caption = (dictionary["Caption"] as! String)
    }
    
}
