//
//  ViewController.swift
//  Funks and Loops
//
//  Created by Jeffrey Eng on 12/19/16.
//  Copyright © 2016 Jeffrey Eng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let area1 = calculateArea(length: 5, width: 10)
        let area2 = calculateArea(length: 6, width: 15)
        let area3 = calculateArea(length: 22, width: 21)
    }

    func calculateArea(length: Int, width: Int) -> Int {
        return length * width
    }

}

