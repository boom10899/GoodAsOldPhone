//
//  ContactViewController.swift
//  GoodAsOldPhone
//
//  Created by Wassapon Watanakeesuntorn on 1/4/2016.
//  Copyright © 2016 Wassapon Watanakeesuntorn. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.contentSize = CGSizeMake(375, 800)
    }

}
