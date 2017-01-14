//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Jeffrey Eng on 1/14/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import CoreData

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
        
//        // Create a list of stores that will be saved in Core Data - Test Data
//        let store = Store(context: context)
//        store.name = "Best Buy"
//        
//        let store2 = Store(context: context)
//        store2.name = "Tesla Dealership"
//        
//        let store3 = Store(context: context)
//        store3.name = "Frys Electronics"
//        
//        let store4 = Store(context: context)
//        store4.name = "Target"
//        
//        let store5 = Store(context: context)
//        store5.name = "Amazon"
//        
//        let store6 = Store(context: context)
//        store6.name = "Apple Store"
//        
//        ad.saveContext()
        getStores()
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
    
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            // set the stores array equal to the result we get back
            self.stores = try context.fetch(fetchRequest)
            // reload the store picker to ensure it's updated
            self.storePicker.reloadAllComponents()
        } catch {
            // handle the error
        }
    }
}
