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
    
    // Property to save and reference current item being edited.
    var itemToEdit: Item?
    
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
        
        // Load the Item data if there is an item to edit
        if itemToEdit != nil {
            loadItemData()
        }
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
    
    @IBAction func savePressed(_ sender: UIButton) {
        //Insert entity into the NSManagedObjectContext
        let item = Item(context: context)
        
        //Assign the data from the text fields to the entity.
        if let title = titleField.text {
            //Assign the value from the text field to the Item's attribute
            item.title = title
        }
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
        }
        if let details = detailsField.text {
            item.details = details
        }
        
        // Setting the store attribute to the selected one in the storePicker
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        // Save
        ad.saveContext()
        
        // After save button is pressed, dismiss VC and pop it off navigation stack
        _ = navigationController?.popViewController(animated: true)
    }
    
    // Method to load up existing item data
    func loadItemData() {
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            
            if let store = item.toStore {
                var index = 0
                repeat {
                    let s = stores[index]
                    if s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                } while index < stores.count
            }
        }
    }
}
