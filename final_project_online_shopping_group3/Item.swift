//
//  Item.swift
//  final_project_online_shopping_group3
//
//  Created by Andrei Konovalov on 12/5/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

import UIKit
import CoreData

class Item: /*NSManagedObject*/NSObject {
   // @NSManaged
    var Name: String!
    //@NSManaged
    var ImageS: String!
    //@NSManaged
    var ImageL: String!
    //@NSManaged
    var Price: NSNumber!
    init(Name: String, ImageS: String, ImageL: String, Price: NSNumber)
    {
        self.Name = Name
        self.ImageS = ImageS
        self.ImageL = ImageL
        self.Price = Price
        
    }
}