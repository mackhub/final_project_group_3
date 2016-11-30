//
//  MyTableViewCell.swift
//  final_project_online_shopping_group3
//
//  Created by Andrei  Konovalov on 11/29/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

   // @IBOutlet var cellItemAmount: UILabel!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var lblValue: UILabel!
    @IBOutlet var cellItemName: UILabel!
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
    lblValue.text = Int(sender.value).description
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
