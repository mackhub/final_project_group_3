//
//  Item.swift
//  final_project_online_shopping_group3
//
//  Created by Andrei Konovalov on 12/5/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name = ""
    var image = ""
    var amount: Int
    init(Name: String,Image:String,Price:Int){
        self.name = Name
        self.image = Image
        self.amount = Price
    }
}
