//
//  CameraVC.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/7/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class CameraVC: AAPLCameraViewController {

    @IBOutlet weak var previewView: AAPLPreviewView!
    
    override func viewDidLoad() {
        
        self._previewView = previewView
        
        super.viewDidLoad()

    }


}

