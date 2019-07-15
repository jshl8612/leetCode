//
//  ViewController.swift
//  addTwoNumbers
//
//  Created by Shenglong Jiang on 15/07/2019.
//  Copyright © 2019 Shenglong Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let l1 = ListNode([1])
        let l2 = ListNode([9,9])
        
        print(l1)
        print(l2)
        
        print(Solution().addTwoNumbers(l1, l2))
    }


    
    
}

