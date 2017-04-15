//
//  CameraVC.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/7/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: AAPLCameraViewController {
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var previewView: AAPLPreviewView!
    
    override func viewDidLoad() {
        
        delegate = self
        
        _previewView = previewView
        
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {

        guard FIRAuth.auth()?.currentUser != nil else {
           
            performSegue(withIdentifier: "LoginVC", sender: nil)
            
            return
        }
    }

    @IBAction func recordButtonPressed(_ sender: UIButton) {
        toggleMovieRecording()
    }

    @IBAction func changeCameraButtonPressed(_ sender: UIButton) {
        changeCamera()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let usersVC = segue.destination as? UsersVC {
            if let videoDict = sender as? Dictionary<String, URL>, let url = videoDict[GlobalConstants.VIDEO_URL] {
            usersVC.videoURL = url
            } else if let snapDict = sender as? Dictionary<String, Data>, let snapData = snapDict[GlobalConstants.SNAPSHOT_DATA] {
                usersVC.snapData = snapData
            }
        }

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
    
    func videoRecordingFailed() {
        print("Video recording failed")
    }
    
    func videoRecordingComplete(_ videoURL: URL!) {
        performSegue(withIdentifier: GlobalConstants.USERS_VC, sender: ["videoURL": videoURL])
    }
 
    func snapshotFailed() {
        print("Snapshot failed")
    }
    
    func snapshotTaken(_ snapshotData: Data!) {
        performSegue(withIdentifier: GlobalConstants.USERS_VC, sender: ["snapshotData": snapshotData])
    }
}
