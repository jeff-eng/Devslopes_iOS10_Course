//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Jeffrey Eng on 2/3/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    //MARK: Properties
    // Create reference for the Pokemon object that is being passed from MainVC to PokemonDetailVC via segue.
    var pokemon: Pokemon!
    
    //MARK: IBOutlet(s)
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeDetailLabel: UILabel!
    @IBOutlet weak var defenseDetailLabel: UILabel!
    @IBOutlet weak var heightDetailLabel: UILabel!
    @IBOutlet weak var pokedexIdDetailLabel: UILabel!
    @IBOutlet weak var weightDetailLabel: UILabel!
    @IBOutlet weak var baseAttackDetailLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoDetailLabel: UILabel!
    
    //MARK: IBAction(s)
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    //MARK: Default methods
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name
        
        // Calls method to run web request for Pokemon data
        pokemon.downloadPokemonDetail {
            
            // Whatever we write here in this trailing closure will only be called after the web request is complete
            
            // Here, what we want to happen is to update the UI(labels), when the data is returned.
            self.updateUI()
            
        }
    }
    
    //MARK: Methods
    func updateUI() {

    }
}
