//
//  PokemonSelectionVC.swift
//  pokefinder
//
//  Created by Jeffrey Eng on 2/25/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class PokemonSelectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    var pokemons: [Pokemon]!
    var filteredPokemons = [Pokemon]()
    var inSearchMode = false
    var keyboardDismissTapGesture: UIGestureRecognizer?

    weak var delegate: PokemonSelectionVCDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
    
//        parseCSV()
        
        searchBar.returnKeyType = .done
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // We need to subscribe to when the keyboard is shown
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        // We also need to subscribe to when the keyboard is hidden
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // Remove the observer when the view isn't being shown anymore
        NotificationCenter.default.removeObserver(self)
        
        super.viewDidDisappear(animated)
    }
    
    //MARK: UICollectionViewDelegate protocol methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedPokemon: Pokemon!
        
        if inSearchMode {
            selectedPokemon = filteredPokemons[indexPath.row]
        } else {
            selectedPokemon = pokemons[indexPath.row]
        }
    
        delegate?.didDismissCollectionView(sender: self, selected: selectedPokemon)
        
    }
    
    //MARK: UICollectionViewDataSource protocol methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue a cell to be recycled
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokemonCell else {
            // Create a default cell as a fallback
            return UICollectionViewCell()
        }
        
        let pokemonInstance: Pokemon!
        // If we're in search mode then use the filteredPokemons array
        if inSearchMode {
            pokemonInstance = filteredPokemons[indexPath.row]
        } else {
        // If we're not in search mode, then use the regular Pokemons array
            pokemonInstance = pokemons[indexPath.row]
        }
        
        cell.configureCell(pokemonInstance)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Use the filtered pokemons array to return the count if in search mode
        if inSearchMode {
            return filteredPokemons.count
        }
        // Use the regular pokemons array by default
        return pokemons.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //MARK: UICollectionViewDelegateFlowLayout protocol methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 110, height: 110)
    }
    
//    func parseCSV() {
//        let filePath = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
//        
//        do {
//            let csv = try CSV(contentsOfURL: filePath)
//            let rows = csv.rows
//            
//            // Loop through the array of dictionaries and pull out the id and name
//            for row in rows {
//                //Grab the Pokedex ID
//                let pokeId = Int(row["id"]!)!
//                //Grab the Pokedex Identifier
//                let pokemonName = row["identifier"]!
//                //Create the Pokemon object
//                let pokemonInstance = Pokemon(name: pokemonName, pokeId: pokeId)
//                pokemons.append(pokemonInstance)
//            }
//            
//        } catch let error as NSError {
//            print(error)
//        }
//    }
    
    //MARK: Search bar methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Case where user selected the search bar but didn't type anything
        if searchBar.text == nil || searchBar.text == "" {
            // Keep search mode off so we don't use the filtered array
            inSearchMode = false
            // Reload the collection view so all the cells show
            collectionView.reloadData()
        } else {
            // Case where user did type something and we want to filter the original array for results that match into a new array
            inSearchMode = true
            
            // Capture the text from the searchbar and make sure its lower cased
            let searchBarText = searchBar.text?.lowercased()
            
            // Filter the array using 'filter'
            filteredPokemons = pokemons.filter({$0.name.range(of: searchBarText!) != nil})
            
            // Reload the collection view with the filteredPokemons array
            collectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func dismissKeyboard(sender: Any) {
        searchBar.resignFirstResponder()
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if keyboardDismissTapGesture == nil {
            // Create an instance of type UIGestureRecognizer     
            keyboardDismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(sender:)))
            // Apply the gesture recognizer to the main view
            self.view.addGestureRecognizer(keyboardDismissTapGesture!)
        }
    }
    
    // Remove the gesture recognizer if the keyboard isn't currently shown based on the notification center observing when the keyboard is hidden and notifying us
    func keyboardWillHide(notification: NSNotification) {
        if keyboardDismissTapGesture != nil {
            self.view.removeGestureRecognizer(keyboardDismissTapGesture!)
            // Reset to its default state
            keyboardDismissTapGesture = nil
        }
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
