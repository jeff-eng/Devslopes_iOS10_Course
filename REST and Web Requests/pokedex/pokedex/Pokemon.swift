//
//  Pokemon.swift
//  pokedex
//
//  Created by Jeffrey Eng on 1/31/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    // MARK: Private variables
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvolutionText: String!
    private var _nextEvolutionName: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionLevel: String!
    private var _pokemonURL: String!
    
    //MARK: Class Properties (Getters)
    var nextEvolutionName: String {
        if _nextEvolutionName == nil {
            _nextEvolutionName = ""
        }
        return _nextEvolutionName
    }
    
    var nextEvolutionId: String {
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    
    var nextEvolutionLevel: String {
        if _nextEvolutionLevel == nil {
            _nextEvolutionLevel = ""
        }
        return _nextEvolutionLevel
    }
    
    var nextEvolutionText: String {
        // Handling if the value is nil
        if _nextEvolutionText == nil {
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }
    
    var baseAttack: String {
        if _baseAttack == nil {
            _baseAttack = ""
        }
        return _baseAttack
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var name: String {
        return _name.capitalized
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    // MARK: Initializer
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    //MARK: Class methods
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            // Print results to see if we get a response
            print(response.result.value as Any)
            
            // Optionally unwrap the dictionary that is returned from the GET request
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                // Call the parseJSON method and pass in the dictionary
                self.parseJSON(from: dict, is: completed)
            }
            completed()
        }
    }
    
    func parseJSON(from pokeDict: Dictionary<String, AnyObject>, is complete: @escaping DownloadComplete) {
        if let weight = pokeDict["weight"] as? String {
            //Set the weight property of Pokemon instance to the value of the key 'weight'.
            self._weight = weight
        }
        
        if let height = pokeDict["height"] as? String {
            self._height = height
        }
        
        if let defense = pokeDict["defense"] as? Int {
            self._defense = "\(defense)"
        }
        
        if let baseAttack = pokeDict["attack"] as? Int {
            self._baseAttack = "\(baseAttack)"
        }
        
        if let types = pokeDict["types"] as? [Dictionary<String, String>], types.count > 0 {
            if let name = types[0]["name"] {
                self._type = name.capitalized
            }
            // Handling cases where there are multiple types by looping through array and concatenating to the existing type property for the Pokemon Class object
            if types.count > 1 {
                for typeIndex in 1..<types.count {
                    if let name = types[typeIndex]["name"] {
                        self._type! += ", \(name.capitalized)"
                    }
                }
            } else {
                self._type = ""
            }
        }
        
        if let descriptionsArray = pokeDict["descriptions"] as? [Dictionary<String, String>], descriptionsArray.count > 0 {
            if let resourceURI = descriptionsArray[0]["resource_uri"] {
                
                let descriptionURL = "\(URL_BASE)\(resourceURI)"
                
                //Make another web request for the descriptions since they reside in a different URL
                Alamofire.request(descriptionURL).responseJSON { (response) in
                    // Print results to see what comes back from the web request
                    print(response.result.value as Any)
                    
                    if let descriptionDict = response.result.value as? Dictionary<String, AnyObject> {
                        self.parseDescriptionJSON(from: descriptionDict)
                    }
                    complete()
                }
            }
        }
        
        if let evolutions = pokeDict["evolutions"] as? [Dictionary<String, AnyObject>], evolutions.count > 0 {
            if let nextEvolution = evolutions[0]["to"] as? String {
                // If no substring matches 'mega', then set the nextEvolution to the class property
                if nextEvolution.range(of: "mega") == nil {
                    self._nextEvolutionName = nextEvolution
                }
            }
                    
            if let uri = evolutions[0]["resource_uri"] as? String {
                // Taking out the URI and leaving the Pokedex ID and '/'
                let extractedIdFromURI = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                // Taking out the remaining forward slash from the extractedIdFromURI
                let nextEvoId = extractedIdFromURI.replacingOccurrences(of: "/", with: "")
                //Set our property to the nextEvoId we extracted from the URI
                self._nextEvolutionId = nextEvoId
            }
            
            if let level = evolutions[0]["level"] as? Int {
                self._nextEvolutionLevel = "\(level)"
            } else {
                self._nextEvolutionLevel = ""
            }
        }
        
        print(self._weight)
        print(self._height)
        print(self._baseAttack)
        print(self._defense)
        print(self._type)
        print(self._nextEvolutionLevel)
        print(self._nextEvolutionId)
        
    }
    
    func parseDescriptionJSON(from descriptionDictionary: Dictionary<String, AnyObject>) {
        if let description = descriptionDictionary["description"] as? String {
            print(description)
            self._description = description
        } else {
            self._description = "No description available at this time."
        }
    }
    
}
