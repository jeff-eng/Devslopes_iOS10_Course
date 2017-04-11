//
//  CameraVC.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/7/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class CameraVC: AAPLCameraViewController {
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var previewView: AAPLPreviewView!
    
    override func viewDidLoad() {
        
        delegate = self
        
        _previewView = previewView
        
        super.viewDidLoad()

    }

    @IBAction func recordButtonPressed(_ sender: UIButton) {
        toggleMovieRecording()
    }

    @IBAction func changeCameraButtonPressed(_ sender: UIButton) {
        changeCamera()
    }
}

extension CameraVC: AAPLCameraVCDelegate {
    
    func shouldEnableCameraUI(_ enable: Bool) {
        cameraButton.isEnabled = enable
        print("Should enable camera UI: \(enable)")
    }
    
    func shouldEnableRecordUI(_ enable: Bool) {
        recordButton.isEnabled = enable
        print("Should enable record UI: \(enable)")
    }
    
    func recordingHasStarted() {
        print("Recording has started")
    }
    
    func canStartRecording() {
        print("Can start recording")
    }
}
