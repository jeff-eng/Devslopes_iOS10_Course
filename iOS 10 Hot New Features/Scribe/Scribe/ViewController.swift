//
//  ViewController.swift
//  Scribe
//
//  Created by Jeffrey Eng on 2/16/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var transcriptionTextView: UITextView!

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide the activity indicator on load of the app
        activityIndicator.isHidden = true
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        // Stop the audio player
        player.stop()
        // Stop animating the activity indicator
        activityIndicator.stopAnimating()
        // Hide the activity indicator
        activityIndicator.isHidden = true
    }
    
    func requestSpeechAuth() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        self.audioPlayer.delegate = self
                        sound.play()
                    } catch {
                        print("Error!")
                    }
                    
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) { (result, error) in
                        if let error = error {
                            print("There was an error: \(error)")
                        } else {
                            self.transcriptionTextView.text = result?.bestTranscription.formattedString
                        }
                    }
                }
            }
        }
    
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        // Show the Activity Indicator
        activityIndicator.isHidden = false
        // Start animating the Activity Indicator
        activityIndicator.startAnimating()
        // Call the function to play the file and enable the speech authorization
        requestSpeechAuth()
    }
    
    
}
