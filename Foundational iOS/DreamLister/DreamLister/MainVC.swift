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
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
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
                // update the cell data.
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
}

