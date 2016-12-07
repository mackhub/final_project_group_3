//
//  Order.swift
//  final_project_online_shopping_group3
//
//  Created by Andrei Konovalov on 12/7/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class Order: NSManagedObject {
    
        @NSManaged var Name: String!
        @NSManaged var ImageS: String!
        @NSManaged var Amount: NSNumber!
        @NSManaged var TotPrice: NSNumber!
    
//        init(Name: String, ImageS: String, ImageL: String, Price: NSNumber)
//        {
//            self.Name = Name
//            self.ImageS = ImageS
//            self.ImageL = ImageL
//            self.Price = Price
//            
//        }
}
