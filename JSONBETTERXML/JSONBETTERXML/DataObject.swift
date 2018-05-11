//
//  DataObject.swift
//  JSONBETTERXML
//
//  Created by Ivan Anyaegbu on 5/11/18.
//  Copyright © Ivan Anyaegbu. All rights reserved.
//

import UIKit

class DataObject: NSObject {
    
    var name = String()
    var format = String()
    var yearStart = String()
    var yearEnd: String?
    var episodesCount: Int!
    var network: String?
    var studio: String?
    var imageURL = String()
    var showDescription = String()
    var showSummary = String()
    var castArray = [Dictionary<String,String>]()
    
    convenience init(withObject dictionary: Dictionary<String, AnyObject>){
        self.init()
        
        name = dictionary["name"] as! String
        format = dictionary["format"] as! String
        yearStart = dictionary["yearStart"] as! String
        if let val = dictionary["yearEnd"]{
            yearEnd = val as? String
        }
        if let val = dictionary["episodes"]{
            episodesCount = val as? Int
        }
        if let val = dictionary["network"]{
            network = val as? String
        }
        if let val = dictionary["studio"]{
            studio = val as? String
        }
        imageURL = dictionary["imageURL"] as! String
        showDescription = dictionary["description"] as! String
        showSummary = dictionary["summary"] as! String
        castArray = dictionary["starring"] as! [Dictionary<String,String>]
    }
}
