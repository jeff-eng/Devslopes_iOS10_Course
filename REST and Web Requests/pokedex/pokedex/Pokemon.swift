//
//  Pokemon.swift
//  pokedex
//
//  Created by Jeffrey Eng on 1/31/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation

class Pokemon {
    // MARK: Private variables
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    
    // MARK: Class Properties
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    // MARK: Initializer
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
}
