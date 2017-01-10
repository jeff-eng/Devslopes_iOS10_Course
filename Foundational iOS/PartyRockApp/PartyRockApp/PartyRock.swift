//
//  PartyRock.swift
//  PartyRockApp
//
//  Created by Jeffrey Eng on 1/10/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation

class PartyRock {
    
    // MARK: Private Variables
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!
    
    // MARK: Getters
    var imageURL: String {
        return _imageURL
    }
    
    var videoURL: String {
        return _videoURL
    }

    var videoTitle: String {
        return _videoTitle
    }
    
    // MARK: Initializer
    init(imageURL: String, videoURL: String, videoTitle: String) {
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
}
