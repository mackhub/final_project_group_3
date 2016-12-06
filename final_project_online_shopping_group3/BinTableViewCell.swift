//
//  BinTableViewCell.swift
//  final_project_online_shopping_group3
//
//  Created by Andrei Konovalov on 12/5/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class BinTableViewCell: UITableViewCell {

    @IBOutlet var cellamount: UILabel!
    @IBOutlet var cellimage: UIImageView!
    @IBOutlet var cellname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
