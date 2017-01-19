//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Jeffrey Eng on 1/12/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        // Create a timestamp for an Item by assign the current date to the 'created' attribute for an Item
        self.created = NSDate()
    }
}
