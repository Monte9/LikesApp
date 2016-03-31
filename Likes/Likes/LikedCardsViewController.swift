//
//  LikedCardsViewController.swift
//  Likes
//
//  Created by Monte's Pro 13" on 3/30/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class LikedCardsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var likedCards: [Card] = []
    var dislikedCards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //setup the logo for titleView in the navigation bar
        let logoImage = UIImage(named: "logo")
        self.navigationItem.title = "Liked Cards"
            
       var font = UIFont(name: "Menlo-Bold", size: 22.0)! ?? UIFont.systemFontOfSize(18.0)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: font, NSForegroundColorAttributeName:UIColor.orangeColor()]

        // let barbuttonFont = UIFont(name: "Ubuntu-Light", size: 15) ?? UIFont.systemFontOfSize(15)
        //UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: barbuttonFont, NSForegroundColorAttributeName:UIColor.whiteColor()], forState: UIControlState.Normal)
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedCards.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LikedCardCell", forIndexPath: indexPath) as! LikedCardTableViewCell
        
        cell.setCardInfo(likedCards[indexPath.row])
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    struct FontHelper {
        static func defaultRegularFontWithSize(size: CGFloat) -> UIFont {
            return UIFont(name: "SourceSansPro-Regular", size: size)!
        }
        
        static func defaultLightFontWithSize(size: CGFloat) -> UIFont {
            return UIFont(name: "SourceSansPro-Light", size: size)!
        }
        
        static func defaultSemiBoldFontWithSize(size: CGFloat) -> UIFont {
            return UIFont(name: "SourceSansPro-Semibold", size: size)!
        }
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
