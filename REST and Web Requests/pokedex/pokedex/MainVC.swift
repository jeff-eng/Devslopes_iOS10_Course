//
//  MainVC.swift
//  pokedex
//
//  Created by Jeffrey Eng on 1/31/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    //MARK: IBOutlet(s)
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: Properties
    var musicPlayer: AVAudioPlayer!
    var inSearchMode = false
    
    //MARK: Arrays
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    
    //MARK: Default methods
    override func viewDidLoad() {
        super.viewDidLoad()
  
        searchBar.delegate = self
        collection.delegate = self
        collection.dataSource = self
        
        // Parse the CSV file when the view loads
        parsePokemonCSV()
        // Play the audio file when the app loads
        initAudio()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Collection View Delegate Methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let poke: Pokemon!
            
            // If in search mode, use the filtered array to build the collection view. Otherwise, use the normal pokemon array.
            if inSearchMode {
                poke = filteredPokemon[indexPath.row]
                cell.configureCell(poke)
            } else {
                poke = pokemon[indexPath.row]
                // Call the cell's configureCell method and pass in the Pokemon instance above to update the cell with the Pokemon instance's name and image.
                cell.configureCell(poke)
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Code goes here to run when the cell is tapped on
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // If in search mode, return the count of the filtered Pokemon array
        if inSearchMode {
            return filteredPokemon.count
        }
        
        return pokemon.count
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
    
    func initAudio() {
        // Create file path to the audio file
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        
        // Error handling in case audio file isn't available
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1 //Loops continuously
            musicPlayer.play()
            
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        if musicPlayer.isPlaying {
            // Pauses music when pressed if the song is playing
            musicPlayer.pause()
            // Make button transparent to indicate paused
            sender.alpha = 0.2
        } else {
            // Resumes playing if the song is paused
            musicPlayer.play()
            // Make button fully opaque when music is playing
            sender.alpha = 1.0
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            // Reload the collection view when there is no text in search bar
            collection.reloadData()
        } else {
            inSearchMode = true
            
            // Making sure the string in the search bar is lower cased to match the format of our Pokemon objects
            let lower = searchBar.text!.lowercased()
            // Use higher-order function 'filter'. The syntax for filter takes a closure as a parameter. $0 is a placeholder for original array(pokemon).
            filteredPokemon = pokemon.filter({$0.name.range(of: lower) != nil})
            // Reload the collection view with the filtered results
            collection.reloadData()
        }
    }
}
