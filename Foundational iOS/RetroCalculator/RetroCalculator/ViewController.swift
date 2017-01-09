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
    var currentOperation = Operation.Empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
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
        
        // Set the output label's text to zero on initial load of the app
        outputLbl.text = "0"
    }

    // MARK: IBActions
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        
        // Create running number so when user taps on number, that number is appended to the end of the runningNumber string variable
        runningNumber += "\(sender.tag)"
        
        // Display the runningNumber in the output label. Access the outputLbl text property and set it equal to the runningNumber variable
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(operation: .Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(operation: .Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(operation: .Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(operation: .Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(operation: currentOperation)
    }
    
    @IBAction func clearBtnPressed(sender: AnyObject) {
        // Play sound when clear button pressed
        playSound()
        
        // Reset the properties
        runningNumber = ""
        currentOperation = Operation.Empty
        leftValStr = ""
        rightValStr = ""
        result = ""
        
        // Set the output label's text to the result property which is reset to empty String
        outputLbl.text = result
    }
    
    
    // MARK: Methods
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        
        btnSound.play()
    }

    func processOperation(operation: Operation) {
        // Play the button sound when operation button tapped
        playSound()
        
        if currentOperation != Operation.Empty {
            
            //A user selected an operator, but then selected another operator without first entering a number
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                // For each case, take both leftValStr and rightValStr, typecast the string as type Double then do the math operation on them. That value is then converted to a string via string interpolation, then saved to the result variable we declared at the top because we plan on using the result variable elsewhere in our code.
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
            }
            // Keep track of current operation that was used
            currentOperation = operation
        } else {
            // This is the first time an operator has been pressed.
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

