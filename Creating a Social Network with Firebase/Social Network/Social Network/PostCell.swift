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
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(post: Post, image: UIImage?) {
        self.caption.text = post.caption
        self.likesLabel.text = "\(post.likes)"
        
        if let postImg = image {
            self.postImage.image = postImg
        } else {
            let imageUrl = post.imageUrl
            postImage.loadingImageIndicator(true)
            let ref = FIRStorage.storage().reference(forURL: imageUrl)
            ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if let err = error {
                    print("Jeff: Unable to download image from Firebase storage - \(err)")
                } else if let imgData = data, let img = UIImage(data: imgData) {
                    print("Jeff: Image downloaded from Firebase storage - \(imgData)")
                    self.postImage.image = img
                    FeedVC.imageCache.setObject(img, forKey: imageUrl as NSString)
                }
            })
        }
    }
    
    
}

