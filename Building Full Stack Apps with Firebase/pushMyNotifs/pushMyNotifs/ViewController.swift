//
//  ViewController.swift
//  pushMyNotifs
//
//  Created by Jeffrey Eng on 2/20/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        FIRMessaging.messaging().subscribe(toTopic: "/topics/news")
        
    }

    
    
}

