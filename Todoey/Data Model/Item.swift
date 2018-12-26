//
//  Item.swift
//  Todoey
//
//  Created by Chris Abbod on 12/24/18.
//  Copyright © 2018 Chris Abbod. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    //An inverse relationship with each Item having a parentCategory that is of the
    //type Category and it comes from the property called "items" from the Category forward relationship
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
