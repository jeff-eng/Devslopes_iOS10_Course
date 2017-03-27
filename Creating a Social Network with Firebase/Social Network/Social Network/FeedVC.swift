//
//  FeedVC.swift
//  Social Network
//
//  Created by Jeffrey Eng on 3/20/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func signOutPressed(_ sender: UIButton) {
        // Remove ID from keychain
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("Jeff: \(keychainResult)")
        // Sign out of Firebase
        try! FIRAuth.auth()?.signOut()
        // Dismiss the current view controller
        dismiss(animated: true, completion: nil)
    }

}

//MARK: Extensions
extension FeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
}
