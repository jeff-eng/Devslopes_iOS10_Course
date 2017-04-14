//
//  UsersVC.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/13/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UsersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var users = [User]()
    fileprivate var selectedUsers = Dictionary<String, User>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        
        downloadUsers()
    }

    // TODO: Move this into the model User struct and do the parsing there
    func downloadUsers() {
        
        DataService.instance.usersRef.observeSingleEvent(of: .value) { (snapshot: FIRDataSnapshot) in
            print("Snap: \(snapshot.debugDescription)")
            
            if let users = snapshot.value as? Dictionary<String, Any> {
                for (key, value) in users {
                    if let dict = value as? Dictionary<String, Any>, let profile = dict["profile"] as? Dictionary<String, Any>, let firstName = profile["firstName"] as? String {
                        
                        let uid = key
                        let user = User(firstName: firstName, uid: uid)
                        self.users.append(user)
                    }
                }
            }
            self.tableView.reloadData()

        }
        
    }

}

extension UsersVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Dequeue a tableview cell for reuse
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        // Get a user from the array
        let user = users[indexPath.row]
        // Set the user from the array as the user property of the cell
        cell.user = user
        // Update the UI
        cell.updateUI()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Refactor this code
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        cell.setCheckmark(selected: true)
        let user = users[indexPath.row]
        selectedUsers[user.uid] = user
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // TODO: Refactor this code
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        cell.setCheckmark(selected: false)
        let user = users[indexPath.row]
        selectedUsers[user.uid] = nil
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    
}

extension UsersVC: UITableViewDelegate {
    
}
