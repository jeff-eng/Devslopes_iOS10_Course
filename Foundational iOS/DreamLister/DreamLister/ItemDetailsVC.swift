//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Jeffrey Eng on 1/14/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    // Array to hold a list of the Store entities
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Replace existing back bar button item that has title with one that has no title
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        // Set the storePicker's delegate and dataSource to this view controller
        storePicker.delegate = self
        storePicker.dataSource = self
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let store = stores[row]
        return store.name
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // We want to return the number of stores in the array
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // Return only one column
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // update when selected
    }
}
