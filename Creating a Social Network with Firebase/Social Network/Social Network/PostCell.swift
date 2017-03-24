//
//  PostCell.swift
//  Social Network
//
//  Created by Jeffrey Eng on 3/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    
}
