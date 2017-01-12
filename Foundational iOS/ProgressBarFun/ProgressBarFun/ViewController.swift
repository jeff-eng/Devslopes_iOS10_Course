//
//  ViewController.swift
//  ProgressBarFun
//
//  Created by Jeffrey Eng on 1/11/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBarView: ProgressBarView!
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func sliderMoved(_ sender: AnyObject) {
        progressBarView.progress = CGFloat(slider.value)
    }

}

