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

class FeedVC: UIViewController, UITableViewDelegate, UINavigationControllerDelegate {

    //MARK: Class properties
    var posts = [Post]()
    var imagePicker: UIImagePickerController!
    
    var keyboardDismissTapGesture: UIGestureRecognizer!
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var addImageButton: UIButton!
    
    //MARK: View methods
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        captionTextField.clearButtonMode = .whileEditing
        
        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            guard let snapshotObjects = snapshot.children.allObjects as? [FIRDataSnapshot] else {
                print("No objects from snapshot available.")
                return
            }
            for snap in snapshotObjects {
                print(" Here is your snap: \(snap)")
                if let postDict = snap.value as? Dictionary<String, Any> {
                    let key = snap.key
                    print("This is your key: \(key)")
                    let post = Post(postKey: key, postData: postDict)
                    self.posts.append(post)
                }
            }
            self.tableView.reloadData()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         NotificationCenter.default.removeObserver(self)
        
        super.viewWillDisappear(true)
    }

    //MARK: IBActions
    @IBAction func signOutPressed(_ sender: UIButton) {
        // Remove ID from keychain
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("Jeff: \(keychainResult)")
        // Sign out of Firebase
        try! FIRAuth.auth()?.signOut()
        // Dismiss the current view controller
        dismiss(animated: true, completion: nil)
    }

    @IBAction func addImagePressed(_ sender: UIButton) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Select an Option", message: "Select camera to take a photo or select from your Photo Library.", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: launchCamera))
        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: launchPhotoLibrary))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
    
    //MARK: Image Picker Methods
    func launchCamera(action: UIAlertAction) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            let cameraUnavailableAlert = UIAlertController(title: "Alert", message: "Unable to detect a camera on your device.", preferredStyle: .alert)
            cameraUnavailableAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(cameraUnavailableAlert, animated: true, completion: nil)
            return
        }
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.modalPresentationStyle = .fullScreen
        present(imagePicker, animated: true, completion: nil)
    }

    func launchPhotoLibrary(action: UIAlertAction) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
}

//MARK: Extensions
extension FeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell else { return PostCell() }
        cell.configureCell(post: posts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
}

extension FeedVC: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            let dummyImage = UIImage()
            addImageButton.setImage(dummyImage, for: .normal)
            return
        }
        addImageButton.setImage(image, for: .normal)
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension FeedVC: KeyboardBehavior {
    func keyboardWillShow(notification: NSNotification) {
        if keyboardDismissTapGesture == nil {
            keyboardDismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(sender:)))
            self.view.addGestureRecognizer(keyboardDismissTapGesture!)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if keyboardDismissTapGesture != nil {
            self.view.removeGestureRecognizer(keyboardDismissTapGesture!)
            keyboardDismissTapGesture = nil
        }
    }
    
    func dismissKeyboard(sender: Any) {
        captionTextField.resignFirstResponder()
    }
}
