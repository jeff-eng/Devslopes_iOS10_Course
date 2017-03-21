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

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signOutTapped(_ sender: UIButton) {
        // Remove ID from keychain
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("Jeff: \(keychainResult)")
        // Sign out of Firebase
        try! FIRAuth.auth()?.signOut()
        // D
        dismiss(animated: true, completion: nil)
    }

}
