//
//  PostCell-Test.swift
//  Social Network
//
//  Created by Jeffrey Eng on 4/4/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import Firebase

var imageCache = NSCache<AnyObject, AnyObject>()

class PostCellTest: UITableViewCell {
    var post: Post? {
        didSet {
            // post image
            postImage.image = nil
        
            if let postImageUrl = post?.imageUrl {
                // Retrieving image from cache
                if let image = imageCache.object(forKey: postImageUrl as AnyObject) as? UIImage {
                    postImage.image = image
                } else {
                    URLSession.shared.dataTask(with: URL(string: postImageUrl)!, completionHandler: { (data, response, error) -> Void in
                        if error != nil {
                            print("Jeff: \(String(describing: error))")
                            return
                        }
                        
                        let image = UIImage(data: data!)
                        
                        // Storing image in cache
                        imageCache.setObject(image!, forKey: postImageUrl as AnyObject)
                        
                        DispatchQueue.main.async(execute: {
                            self.postImage.image = image
                        })
                    }).resume()
            
                }
           
            }
            // caption
            caption.text = post?.caption
            // likes
            likesLabel.text = String(describing: post?.likes)
        }
    }
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    
    
    
}

