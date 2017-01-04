//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Jeffrey Eng on 1/3/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var outputLbl: UILabel!

    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        
        // Create running number so when user taps on number, that number is appended to the end of the runningNumber string variable
        runningNumber += "\(sender.tag)"
        
        // Display the runningNumber in the output label. Access the outputLbl text property and set it equal to the runningNumber variable
        outputLbl.text = runningNumber
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        
        btnSound.play()
    }

}

