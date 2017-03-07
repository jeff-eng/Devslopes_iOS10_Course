//
//  Pokemon.swift
//  pokefinder
//
//  Created by Jeffrey Eng on 2/25/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation

class Pokemon {
    // Private variables
    private var _name: String!
    private var _pokeId: Int!
    
    //Getters
    // variable to store Pokemon name
    var name: String {
        return _name
    }
    // variable to store PokeId
    var pokeId: Int {
        return _pokeId
    }
    
    // Initializer
    init(name: String, pokeId: Int) {
        self._name = name
        self._pokeId = pokeId   
    }
}
