//
//  ProductViewController.swift
//  GoodAsOldPhone
//
//  Created by Wassapon Watanakeesuntorn on 1/4/2016.
//  Copyright © 2016 Wassapon Watanakeesuntorn. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
//    var productName: String?
//    var cellImageName: String?

    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        productNameLabel.text = "1937 Desk Phone"
//        productImageView.image = UIImage(named: "phone-fullscreen3")
        
//        productNameLabel.text = productName
        
        if let p = product {
            productNameLabel.text = p.name
            if let i = p.productImage {
                productImageView.image = UIImage(named: i)
            }
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func addToCartPressed(sender: AnyObject) -> Void {
        print("Button Tapped")
       
        guard let product = product, let name = product.name, let price = product.price else {
            return
        }
        
        // create an order
        let order = Order()
        order.product = product
        
        var ordersInCart = Orders.readOrdersFromArchieve()
        if(ordersInCart == nil) {
            ordersInCart = []
        }
        ordersInCart?.append(order)
        
        // save this to disk
        
        if let orders = ordersInCart {
            Orders.saveOrdersToArchieve(orders)
        }
        
        let alertController = UIAlertController(title: "Added to Cart", message: "You added \(name) item to the cart and it costs $\(price)", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}
