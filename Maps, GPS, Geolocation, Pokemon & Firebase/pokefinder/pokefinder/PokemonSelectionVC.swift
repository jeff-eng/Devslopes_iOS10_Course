//
//  PokemonSelectionVC.swift
//  pokefinder
//
//  Created by Jeffrey Eng on 2/25/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class PokemonSelectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var pokemon = [Pokemon]()
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        parseCSV()
    }

    
    //MARK: UICollectionViewDelegate protocol methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Runs the code when the cell is tapped
    }
    
    //MARK: UICollectionViewDataSource protocol methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue a cell to be recycled
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokemonCell else {
            // Create a default cell as a fallback
            return UICollectionViewCell()
        }
        
        let pokemonInstance = pokemon[indexPath.row]
        cell.configureCell(pokemonInstance)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //MARK: UICollectionViewDelegateFlowLayout protocol methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 110, height: 110)
    }
    
    func parseCSV() {
        let filePath = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: filePath)
            let rows = csv.rows
            print(rows)
            
            // Loop through the array of dictionaries and pull out the id and name
            for row in rows {
                //Grab the Pokedex ID
                let pokeId = Int(row["id"]!)!
                //Grab the Pokedex Identifier
                let pokemonName = row["identifier"]!
                //Create the Pokemon object
                let pokemonInstance = Pokemon(name: pokemonName, pokeId: pokeId)
                pokemon.append(pokemonInstance)
            }
            
        } catch let error as NSError {
            print(error)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
