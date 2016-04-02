//
//  LikedCardTableViewCell.swift
//  Likes
//
//  Created by Monte's Pro 13" on 3/30/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class LikedCardTableViewCell: UITableViewCell {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var card: Card?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardImageView.layer.masksToBounds = true
        cardImageView.layer.cornerRadius = cardImageView.bounds.height/2
    }
    
    func setCardInfo(card: Card?) {
        self.card = card
        //cardImageView.image = UIImage(named: (card?.imageName)!)
        cardImageView.setImageWithURL(card?.imageURL)
        captionLabel.text = card?.caption
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
