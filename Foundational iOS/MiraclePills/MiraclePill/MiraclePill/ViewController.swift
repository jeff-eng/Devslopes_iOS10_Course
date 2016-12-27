//
//  ViewController.swift
//  MiraclePill
//
//  Created by Jeffrey Eng on 12/20/16.
//  Copyright © 2016 Jeffrey Eng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: IBOutlets & Properties
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    

    
    // Create a list of states using an array (an array is the most simple and logical data structure to organize a list of states)
    let states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    
    @IBAction func stateBtnPressed(_ sender: Any) {
        // Show the picker when button pressed
        statePicker.isHidden = false
        
        // Hide the zip code label and text field.
        zipCodeLabel.isHidden = true
        zipCodeTextField.isHidden = true
        
        // Hide the country label and text field
        countryLabel.isHidden = true
        countryTextField.isHidden = true
    }

    @IBAction func buyNowBtn(_ sender: UIButton) {
    
    }
    
    
    // MARK: Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // Returning 1 because we only want a single(1) column of states to pick through.
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // return the number of states in our list of states (the array)
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: .normal)
        
        // Hide the state picker after state is selected.
        statePicker.isHidden = true
        
        // Show the zip code label and text field.
        zipCodeLabel.isHidden = false
        zipCodeTextField.isHidden = false
        
        // Show the country label and text field.
        countryLabel.isHidden = false
        countryTextField.isHidden = false
        
    }
}

