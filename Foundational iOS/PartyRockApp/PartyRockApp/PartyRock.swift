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
    // The purpose of Getters here is to prevent outside classes from manipulating the data in this class.
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
    // Pass in the imageURL, videoURL, and videoTitle data whenever an instance of PartyRock is created.
    init(imageURL: String, videoURL: String, videoTitle: String) {
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
}
