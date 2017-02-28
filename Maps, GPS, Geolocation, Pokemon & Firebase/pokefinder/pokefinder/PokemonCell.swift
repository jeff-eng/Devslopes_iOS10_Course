//
//  PokemonCell.swift
//  pokefinder
//
//  Created by Jeffrey Eng on 2/25/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    var pokemon: Pokemon!
    
    // Configure the cell image and label
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        // Change the text of the nameLabel
        nameLabel.text = pokemon.name.capitalized
        // Change the image of the pokemon
        pokemonImage.image = UIImage(named: "\(self.pokemon.pokeId)")
    }
    
}
