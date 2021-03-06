//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Jeffrey Eng on 1/14/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    @IBOutlet weak var thumbImg: UIImageView!
    
    // Array to hold a list of the Store entities
    var stores = [Store]()
    // Array to hold a list of the ItemType entities
    var itemTypes = [ItemType]()
    
    // Property to save and reference current item being edited.
    var itemToEdit: Item?
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Replace existing back bar button item that has title with one that has no title
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        // Set the storePicker's delegate and dataSource to this view controller
        storePicker.delegate = self
        storePicker.dataSource = self
        
        // Instantiate the Image Picker and set delegate to self (the VC)
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
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
        getItemTypes()
        
        // Load the Item data if there is an item to edit
        if itemToEdit != nil {
            loadItemData()
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Populate the picker views with Store names and Item Types
        if component == 0 {
            let store = stores[row]
            return store.name
        } else {
            let item = itemTypes[row]
            return item.type
        }
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // We want to return the number of stores in each array
        if component == 0 {
            return stores.count
        } else {
            return itemTypes.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // Return two columns - first column is Stores, second column is Item Types
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
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

    func getItemTypes() {
        let fetchRequest: NSFetchRequest<ItemType> = ItemType.fetchRequest()
        
        do {
            self.itemTypes = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            // handle the error
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        var item: Item!
        
        // Inserting a new image entity into the NSManagedObjectContext
        let picture = Image(context: context)
        // Assign image we selected from the camera roll to the image attribute for that image
        picture.image = thumbImg.image
        
        if itemToEdit == nil {
            // Insert new item if itemToEdit isn't currently assigned to an item
            item = Item(context: context)
        } else {
            item = itemToEdit
        }
        
        // Associate that image to the item
        item.toImage = picture
        
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
        // Setting the item type attribute to the selected one in the storePicker
        item.toItemType = itemTypes[storePicker.selectedRow(inComponent: 1)]
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
            thumbImg.image = item.toImage?.image as? UIImage
            
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
            
            if let itemType = item.toItemType {
                var index = 0
                repeat {
                    let i = itemTypes[index]
                    if i.type == itemType.type {
                        storePicker.selectRow(index, inComponent: 1, animated: false)
                        break
                    }
                    index += 1
                } while index < itemTypes.count
            }
        }
    }
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        // Delete if there is item to edit exists
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        // Dismiss the ItemDetailsVC and pop off navigation stack when delete button pressed
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            thumbImg.image = img
        }
        
        // Dismiss the Image Picker Controller after selection
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
