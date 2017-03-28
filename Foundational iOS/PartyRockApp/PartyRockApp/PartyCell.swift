//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Jeffrey Eng on 1/10/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {
    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        
        // Create URL object that iOS can handle
        let url = URL(string: partyRock.imageURL)!

        // Attempt to download an image on the background thread so it doesn't freeze the app
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                // Update the UI with an image for the preview image using the main thread
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                //handle the error
            }
        }
    }
}
