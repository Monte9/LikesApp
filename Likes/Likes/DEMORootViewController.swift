//
//  DEMORootViewController.swift
//  Likes
//
//  Created by Monte's Pro 13" on 3/31/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit
import RESideMenu

class DEMORootViewController: RESideMenu, RESideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func awakeFromNib() {
        
        self.menuPreferredStatusBarStyle = UIStatusBarStyle.LightContent
        self.contentViewShadowColor = UIColor.blueColor()
        self.contentViewShadowOffset = CGSizeMake(0, 0)
        self.contentViewShadowOpacity = 0.6
        self.contentViewShadowRadius = 12
        self.contentViewShadowEnabled = true

        self.contentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("contentViewController")
        self.leftMenuViewController = self.storyboard?.instantiateViewControllerWithIdentifier("leftMenuViewController")
        
        self.backgroundImage = UIImage(named: "background")
        self.delegate = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
