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
    
    var categories: [String] = ["bernie",
                                "mars", "modelX", "yosemite"]
    
    var categoryAnswers = [String: Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup the logo for titleView in the navigation bar
        let logoImage = UIImage(named: "logo")
        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        resultsLabel.hidden = true
        
        cardsView.profileImage = UIImage(named: categories[0])
        cardsView.about = "Do you like \(categories[0])?"

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.showNewUser), name: userDidAnswer, object: nil)
    }
    
    func showNewUser() {
        
        if cardsView.answerYes == true && i < 4  {
            cardsView.profileImage = UIImage(named: categories[i])
            cardsView.about = "Do you like \(categories[i])?"
            categoryAnswers[categories[i]] = 1
            cardsView.numberYes = cardsView.numberYes + 1
        } else if i < 4 {
            cardsView.profileImage = UIImage(named: categories[i])
            cardsView.about = "Do you like \(categories[i])?"
            categoryAnswers[categories[i]] = 0
            cardsView.numberNo = cardsView.numberNo + 1
        } else if i == 4 {
            if cardsView.answerYes == true {
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
//        cardsView.profileImage = UIImage(named: categories[0])
//        cardsView.about = "Do you like \(categories[0])?"
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
