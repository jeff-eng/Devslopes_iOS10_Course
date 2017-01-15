//
//  MainVC.swift
//  DreamLister
//
//  Created by Jeffrey Eng on 1/12/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!

    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Generate our test data for purpose of testing the app
//        generateTestData()
        
        attemptFetch()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        
        return cell
    }
    
    func configureCell(cell: ItemCell, indexPath: NSIndexPath) {
        
        let item = controller.object(at: indexPath as IndexPath)
        // Calls configureCell method in the custom ItemCell class
        cell.configureCell(item: item)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Check to make sure there are objects in our fetched results controller
        if let objs = controller.fetchedObjects, objs.count > 0 {
            let item = objs[indexPath.row]
            performSegue(withIdentifier: "ItemDetailsVC", sender: item)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Passing information from MainVC to ItemDetailsVC
        if segue.identifier == "ItemDetailsVC" {
            if let destination = segue.destination as? ItemDetailsVC {
                if let item = sender as? Item {
                    destination.itemToEdit = item
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // If there are sections, then get a reference to it
        if let sections = controller.sections {
            // Get the info out of the section
            let sectionInfo = sections[section]
            // Return the count of them
            return sectionInfo.numberOfObjects
        }
        // If there aren't any, then return zero
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // Once we have data in our database, we need a way to fetch it and display it
    func attemptFetch() {
        // Fetch Request for Items
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        // Sorting by date using the created attribute
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        // Sort descriptors expects an array
        fetchRequest.sortDescriptors = [dateSort]
        
        //Instantiate the Fetched Results Controller - pass in which fetch request we're working with(fetching Items); context comes from app delegate
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        // Need set the delegate to 'self' so the methods created below can listen for updates to the data and update the table view.
        controller.delegate = self
        
        self.controller = controller
        
        // Perform Fetch - A fetch request can fail, so we need to implement error handling with a do-catch statement
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
    
    // Whenever the table view is about to update, this method listens for changes and will update the table view for you.
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    }
    
    // This method is checking for when changes have occurred, it will stop updating the table view for you.
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // This is listening for when we are going to be making a change - insertion, deletion, update, move.
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
        
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case.update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        case.move:
            // Deletes the row at the current index path
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            // Then inserts it at the new index path
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    
    func generateTestData() {
        let item = Item(context: context)
        item.title = "MacBook Pro"
        item.price = 1800
        item.details = "I can't wait until the September event, I hope they release new MBPs"
        
        let item2 = Item(context: context)
        item2.title = "Dell Ultrasharp Monitor"
        item2.price = 400
        item2.details = "Need me a new monitor so I can run Xcode on a bigger screen!"
        
        let item3 = Item(context: context)
        item3.title = "LG OLED TV"
        item3.price = 2500
        item3.details = "Best TV on the market. 4K and HDR make me drool."
        
        // Calling this app delegate method will save it to the database
        ad.saveContext()
    }
}

