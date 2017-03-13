//
//  PokeAnnotation.swift
//  pokefinder
//
//  Created by Jeffrey Eng on 2/22/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation
import MapKit

class PokeAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokeID: Int
    var pokemonName: String
    var title: String? {
        get {
            return pokemonName.capitalized
        }
    }
    
    init(coordinate: CLLocationCoordinate2D, pokeID: Int, pokemonName: String) {
        self.coordinate = coordinate
        self.pokeID = pokeID
        self.pokemonName = pokemonName
    }
}
