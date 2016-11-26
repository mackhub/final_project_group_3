//
//  HomeVC.swift
//  final_project_online_shopping_group3
//
//  Created by Andrei  Konovalov on 11/23/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewDidAppear(animated: Bool) {
//        self.performSegueWithIdentifier("goto_login", sender: self)
//    }
    
    @IBAction func logoutTapped(sender: UIButton) {
        self.performSegueWithIdentifier("goto_login", sender: self)

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        if (isLoggedIn != 1) {
            self.performSegueWithIdentifier("goto_login", sender: self)
        //} else {
           // self.usernameLabel.text = prefs.valueForKey("USERNAME") as NSString
        }
    }


    /*
    // MARK: - Navigation                                             https://dipinkrishna.com/blog/2015/07/ios-login-signup-screen-tutorial-swift-2-xcode-7-ios-9-json/                                   responsive design json -------------- for Andreid don't delete

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
