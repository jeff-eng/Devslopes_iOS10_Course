//
//  MainVC.swift
//  pokedex
//
//  Created by Jeffrey Eng on 1/31/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK: IBOutlet(s)
    
    @IBOutlet weak var collection: UICollectionView!
    
    //MARK: Array
    var pokemon = [Pokemon]()
    
    //MARK: Default methods
    override func viewDidLoad() {
        super.viewDidLoad()
  
        collection.delegate = self
        collection.dataSource = self
        
        // Parse the CSV file when the view loads
        parsePokemonCSV()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: Collection View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            // Create instance of Pokemon class
            let pokemon = Pokemon(name: "Pokemon", pokedexId: indexPath.row)
            // Call the cell's configureCell method and pass in the Pokemon instance above to update the cell with the Pokemon instance's name and image.
            cell.configureCell(pokemon)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Code goes here to run when the cell is tapped on
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    //MARK: Methods
    
    func parsePokemonCSV() {
        // Create filepath for the pokemon.csv file
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        // Try-catch block used to process the pokemon.csv file using the csv.swift helper
        do {
            // Uses the CSV parser
            let csv = try CSV(contentsOfURL: path)
            // Pull out the rows from the CSV file
            let rows = csv.rows
            print(rows)
            
            // Loop through each row in the data pulling out the ID and name values using the dictionary keys, then create and append the Pokemon instances in array
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                // Create your Pokemon instance
                let poke = Pokemon(name: name, pokedexId: pokeId)
                // Append Pokemon instance to the pokemon array
                pokemon.append(poke)
            }
        
        } catch let error as NSError {
            print(error.debugDescription)
        }

    }
}

