//
//  ProductTableViewController.swift
//  GoodAsOldPhone
//
//  Created by Wassapon Watanakeesuntorn on 1/4/2016.
//  Copyright © 2016 Wassapon Watanakeesuntorn. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {
    
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        
        product1.name = "1907 Wall Set"
        product1.productImage = "phone-fullscreen1"
        product1.cellImage = "image-cell1"
        product1.price = 59.99
        
        product2.name = "1921 Dial Phone"
        product2.productImage = "phone-fullscreen2"
        product2.cellImage = "image-cell2"
        product2.price = 39.99
        
        product3.name = "1937 Desk Set"
        product3.productImage = "phone-fullscreen3"
        product3.cellImage = "image-cell3"
        product3.price = 0.99
        
        product4.name = "1984 Motorola Portable"
        product4.productImage = "phone-fullscreen3"
        product4.cellImage = "image-cell3"
        product4.price = 19.99
        
        products = [product1, product2, product3, product4]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let p = products {
            return p.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)
        
//        cell.textLabel?.text = "Hello friend"
//        cell.imageView?.image = UIImage(named: "image-cell1")

        let product = products?[indexPath.row]
        
        if let p = product {
            cell.textLabel?.text = p.name
            if let i = p.cellImage {
                cell.imageView?.image = UIImage(named: i)
            }
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowProduct" {
            let productVC = segue.destinationViewController as? ProductViewController
            
            if let cell = sender as? UITableViewCell {
                if let indexPath = tableView.indexPathForCell(cell) {
                    productVC?.product = products?[indexPath.row]
                }
            }
            
//            guard let cell = sender as? UITableViewCell,
//                let indexPath = tableView.indexPathForCell(cell) else {
//                    return
//                }
//            productVC?.productName = productNames?[indexPath.row]

        }
    }
    
}
