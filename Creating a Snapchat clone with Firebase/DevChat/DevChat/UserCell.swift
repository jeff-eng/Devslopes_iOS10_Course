//
//  UserCell.swift
//  DevChat
//
//  Created by Jeffrey Eng on 4/13/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    var user: User?
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckmark(selected: false)
    }

    func updateUI() {
        firstNameLabel.text = user?.firstName
    }
    
    func setCheckmark(selected: Bool) {
        let imageString = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageString))
    }

}
