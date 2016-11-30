//
//  PofileVCViewController.swift
//  final_project_online_shopping_group3
//
//  Created by Andrei  Konovalov on 11/30/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class PofileVCViewController: UIViewController {

    @IBAction func logoutTapped(sender: UIButton) {
            self.performSegueWithIdentifier("goto_login", sender: self)
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
