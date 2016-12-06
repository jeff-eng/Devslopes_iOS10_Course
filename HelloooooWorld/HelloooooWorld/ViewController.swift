//
//  ViewController.swift
//  HelloooooWorld
//
//  Created by Jeffrey Eng on 12/5/16.
//  Copyright © 2016 Jeffrey Eng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
     @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var welcomeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func welcomePressed(_ sender: Any) {
        // When 'Welcome' button is tapped, the background and title image appear. The 'Welcome' button will disappear.
        background.isHidden = false
        titleImage.isHidden = false
        welcomeBtn.isHidden = true
        
    }

}

