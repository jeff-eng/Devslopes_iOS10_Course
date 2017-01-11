//
//  ViewController.swift
//  mvc-test
//
//  Created by Jeffrey Eng on 1/11/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var renameField: UITextField!

    let person = Person(first: "John", last: "Hancock")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullName.text = person.fullName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPressed(_ sender: Any) {
        if let txt = renameField.text {
            person.firstName = txt
            fullName.text = person.fullName
        }
    }

}

