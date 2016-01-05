//
//  Orders.swift
//  GoodAsOldPhone
//
//  Created by Wassapon Watanakeesuntorn on 1/5/2016.
//  Copyright © 2016 Wassapon Watanakeesuntorn. All rights reserved.
//

import UIKit

class Orders: NSObject, NSCoding {
    var orders: [Order]?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.orders = aDecoder.decodeObjectForKey("orders") as? [Order]
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(orders, forKey: "orders")
    }
    
    class func archieveFilePath() -> String {
        let documentsDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsDirectory.URLByAppendingPathComponent("cart.archive").path!
    }
    
    class func readOrdersFromArchieve() -> [Order]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(archieveFilePath()) as? [Order]
    }
    
    class func saveOrdersToArchieve(orders: [Order]) -> Bool {
        return NSKeyedArchiver.archiveRootObject(orders, toFile: archieveFilePath())
    }
}
