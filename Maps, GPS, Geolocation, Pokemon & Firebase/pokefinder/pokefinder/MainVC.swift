//
//  MainVC.swift
//  pokefinder
//
//  Created by Jeffrey Eng on 2/21/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseDatabase

class MainVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
   
    //MARK: Class properties
    var pokemons = [Pokemon]()
    var selectedPokemonId: Int!

    let locationManager = CLLocationManager()
    var mapHasCenteredOnce = false
    
    var geoFire: GeoFire!
    var geoFireRef: FIRDatabaseReference!

    //MARK: Default View methods
    override func viewDidLoad() {
        super.viewDidLoad()
     
        parseCSV()
        
        mapView.delegate = self
        // Setting the tracking mode to keep centered on user's location
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
        // Creating reference for the Firebase Database
        geoFireRef = FIRDatabase.database().reference()
        // Initialize GeoFire
        geoFire = GeoFire(firebaseRef: geoFireRef)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationAuthStatus()
    }
    
    //MARK: Location methods
    // Method prompting to obtain permission for user's location
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    // CLLocationManager Delegate method that monitors authorization status
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Shows user location on the map view after checking that user authorized
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }
    
    // Method to center map on user's current location
    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    //MARK: Map View methods
    // Update this callback/protocol function for when the user's location is actually updated
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        // Optionally unwrap user's updated location
        if let loc = userLocation.location {
            // Check when the map has already been centered once(generally on initial app load)
            if !mapHasCenteredOnce {
                // Center the map with the user's updated location
                centerMapOnLocation(loc)
                mapHasCenteredOnce = true
            }
        }
    }
    
    // Updating this callback/protocol function to replace the location dot with sprite image.  This function is called whenever we add an annotation to the map
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annoIdentifier = "Pokemon"
        // Create uninstantiated reference of annotation view
        var annotationView: MKAnnotationView?
        
        // If annotation is a User Location annotation, we want to change it
        if annotation.isKind(of: MKUserLocation.self) {
            // Create the instance
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
            // Change the image of the annotation to the sprite image
            annotationView?.image = UIImage(named: "ash")
        } else if let deqAnno = mapView.dequeueReusableAnnotationView(withIdentifier: annoIdentifier) {
            // Replace the annotation view with a dequeued annotation view
            annotationView = deqAnno
            // Set the now-dequeued annotation view to the annotation
            annotationView?.annotation = annotation
        } else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annoIdentifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }
        
        // Customize the annotation view
        if let annotationView = annotationView, let anno = annotation as? PokeAnnotation {
            // Show the popup when selected (note that annotation title is required for the callout)
            annotationView.canShowCallout = true
            // Setting the annotation image to the Pokemon image
            annotationView.image = UIImage(named: "\(anno.pokeID)")
            // Create button
            let btn = UIButton()
            let deleteBtn = UIButton()
            // Set the dimensions
            deleteBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            // Set the image of the buttons
            deleteBtn.setImage(UIImage(named: "delete"), for: .normal)
            btn.setImage(UIImage(named: "map"), for: .normal)
            // Add the buttons to the pop up displayed on the annotation
            annotationView.rightCalloutAccessoryView = deleteBtn
            annotationView.leftCalloutAccessoryView = btn
        }
        
        return annotationView
    }
    
    // When user pans across the map, we want to update the map with the Pokemon sightings
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        // Obtain the user's center in lat/long coordinates
        let location = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        // Show the sightings based on user's new updated location after panning
        showSightingsOnMap(location)
    }
    
    // Implement behavior when callout accessory control is tapped
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if let anno = view.annotation as? PokeAnnotation {
            if control == view.rightCalloutAccessoryView {
                print("The delete button was tapped!")
                removeSighting(withPokemon: anno.pokeID)
                mapView.removeAnnotation(anno)
            } else {
                // Configure map view before it's loaded
                // Create a placemark (an object that stores address info)
                let place = MKPlacemark(coordinate: anno.coordinate)
                // Create a destination
                let destination = MKMapItem(placemark: place)
                // Give the destination a name
                destination.name = "\(anno.title!) sighting"
                // Set a region distance
                let regionDistance: CLLocationDistance = 1000
                // Set which portion of the map to display
                let regionSpan = MKCoordinateRegionMakeWithDistance(anno.coordinate, regionDistance, regionDistance)
                // Set the options that will be passed to Apple Maps
                let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span), MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDefault] as [String: Any]
                
                // Open Apple Maps with all the options we set
                MKMapItem.openMaps(with: [destination], launchOptions: options)
            }
        }
    }
    
    //MARK: Pokemon Sighting methods
    // Whenever you see a Pokemon, this method is called and sets the location for the specific Pokemon using the PokeID as the key
    func createSighting(forLocation location: CLLocation, withPokemon pokeId: Int) {
        // Call the GeoFire's setLocation method, which stores the location and associated PokeID key
        geoFire.setLocation(location, forKey: "\(pokeId)")
    }
    
    //Method to remove the sighting from Firebase
    func removeSighting(withPokemon pokeId: Int) {
        
        geoFire.removeKey(String(pokeId))
    }
    
    // Whenever we get user's location, we display Pokemon sightings on the map
    func showSightingsOnMap(_ location: CLLocation) {
        // Create a query at a specific location with specified radius (in km)
        let circleQuery = geoFire!.query(at: location, withRadius: 2.5)
        // Observe whenever we find a sighting
        _ = circleQuery?.observe(GFEventType.keyEntered, with: { (key, location) in
          
            // Optionally binding key and location b/c it could be nil
            if let key = key, let location = location {
                // Create a PokeAnnotation object using the location and pokeID
                let pokemonFromArray = self.pokemons[Int(key)! - 1]
                let anno = PokeAnnotation(coordinate: location.coordinate, pokeID: pokemonFromArray.pokeId, pokemonName: pokemonFromArray.name)

                self.mapView.addAnnotation(anno)
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectionVC = segue.destination as? PokemonSelectionVC, segue.identifier == "PokemonSelectionVC" {
                selectionVC.delegate = self
                selectionVC.pokemons = pokemons
        }
    }
    
}

extension MainVC: PokemonSelectionVCDelegate {
    
    func didDismissCollectionView(sender: PokemonSelectionVC, selected: Pokemon) {
        
        // Get the user's current location
        let location = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        
        pokemons = sender.pokemons
        selectedPokemonId = selected.pokeId
        createSighting(forLocation: location, withPokemon: selectedPokemonId)
        
        dismiss(animated: true, completion: nil)
    }
}

extension MainVC {

    func parseCSV() {
        let filePath = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: filePath)
            let rows = csv.rows
            
            // Loop through the array of dictionaries and pull out the id and name
            for row in rows {
                //Grab the Pokedex ID
                let pokeId = Int(row["id"]!)!
                //Grab the Pokedex Identifier
                let pokemonName = row["identifier"]!
                //Create the Pokemon object
                let pokemonInstance = Pokemon(name: pokemonName, pokeId: pokeId)
                pokemons.append(pokemonInstance)
            }
            
        } catch let error as NSError {
            print(error)
        }
    }
}
