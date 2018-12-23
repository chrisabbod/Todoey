//
//  item.swift
//  Todoey
//
//  Created by Chris Abbod on 12/22/18.
//  Copyright © 2018 Chris Abbod. All rights reserved.
//

import Foundation

//Keyword Codable specifies that this class conforms with both Encodable and Decodable protocols
class Item: Codable {
    var title : String = ""
    var done : Bool = false
    
}
