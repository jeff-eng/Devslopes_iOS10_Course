//
//  MainVC.swift
//  TacoPOP
//
//  Created by Jeffrey Eng on 2/13/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.addDropShadow()
    }
    

}
