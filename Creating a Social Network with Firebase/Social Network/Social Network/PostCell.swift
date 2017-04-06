//
//  PostCell.swift
//  Social Network
//
//  Created by Jeffrey Eng on 3/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import Firebase

class PostCell: UITableViewCell {

    var activityIndicator: UIActivityIndicatorView?
    var post: Post?
    
    var likesRef: FIRDatabaseReference!
    private let likedImage = UIImage(named: "filled-heart")
    private let notLikedImage = UIImage(named: "empty-heart")
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(_ post: Post) {
        self.caption.text = post.caption
        self.likesLabel.text = "\(post.likes)"
        
        likesRef = DataService.ds.REF_USER_CURRENT.child("likes").child(post.postKey)
        
        let imageUrl = post.imageUrl
        
        //Retrieve image from cache if available
        if let image = FeedVC.imageCache.object(forKey: (imageUrl as NSString)) {
            postImage.image = image
        } else {
            // Make network call to Firebase to download image, then save to cache
            let ref = FIRStorage.storage().reference(forURL: imageUrl)
            ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print("Jeff: Unable to download image from Firebase storage - \(String(describing: error))")
                    return
                } else if let imageData = data, let image = UIImage(data: imageData) {
                    print("Jeff: Image downloaded from Firebase storage.")
                    // Store image in cache
                    FeedVC.imageCache.setObject(image, forKey: imageUrl as NSString)
                    
                    DispatchQueue.main.async(execute: {
                        self.postImage.image = image
                    })
                }
            }).resume()
        }

        likesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let _ = snapshot.value as? NSNull {
                self.likeButton.setImage(self.notLikedImage, for: .normal)
            } else {
                self.likeButton.setImage(self.likedImage, for: .normal)
            }
        })
    }
    
    @IBAction func likeButtonPressed(sender: UIButton) {
        likesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let _ = snapshot.value as? NSNull {
                self.likeButton.setImage(self.likedImage, for: .normal)
                self.post?.adjustLikes(addLike: true)
                self.likesRef.setValue(true)
            } else {
                self.likeButton.setImage(self.notLikedImage, for: .normal)
                self.post?.adjustLikes(addLike: false)
                self.likesRef.removeValue()
            }
        
        })
    }
    
}

