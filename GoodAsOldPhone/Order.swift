//
//  Order.swift
//  GoodAsOldPhone
//
//  Created by Wassapon Watanakeesuntorn on 1/5/2016.
//  Copyright © 2016 Wassapon Watanakeesuntorn. All rights reserved.
//

import UIKit

class Order: NSObject, NSCoding {
    var product: Product?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.product = aDecoder.decodeObjectForKey("product") as? Product
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(product, forKey: "product")
    }
}
