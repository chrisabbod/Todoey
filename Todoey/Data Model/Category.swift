//
//  Category.swift
//  Todoey
//
//  Created by Chris Abbod on 12/24/18.
//  Copyright © 2018 Chris Abbod. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var color : String = ""
    
    //Realm syntax to define a to-many forward relationship
    //This means each category can have a number of Item objects
    let items = List<Item>()
}
