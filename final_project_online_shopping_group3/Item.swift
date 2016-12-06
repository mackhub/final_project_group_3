//
//  Item.swift
//  final_project_online_shopping_group3
//
//  Created by Andrei Konovalov on 12/5/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class Item: NSManagedObject {
    @NSManaged var name: String!
    @NSManaged var image: String!
    @NSManaged var amount: NSNumber!
}
