//
//  ViewController.swift
//  pokefinder
//
//  Created by Jeffrey Eng on 2/21/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseDatabase

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!

    //MARK: Class properties
    let locationManager = CLLocationManager()
    var mapHasCenteredOnce = false
    var geoFire: GeoFire!
    var geoFireRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        mapView.delegate = self
        // Setting the tracking mode to keep centered on user's location
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
        // Creating reference for the Firebase Database
        geoFireRef = FIRDatabase.database().reference()
        // Initialize GeoFire
        geoFire = GeoFire(firebaseRef: geoFireRef)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Call locationAuthStatus method after the View appears
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
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }
    
    // Method to center map on user's current location
    func centerMapOnLocation(location: CLLocation) {
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
                centerMapOnLocation(location: loc)
                mapHasCenteredOnce = true
            }
        }
    }
    
    // Updating this callback/protocol function to replace the location dot with sprite image
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
            annotationView = deqAnno
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
            annotationView.image = UIImage(named: "\(anno.pokeID)")
            let btn = UIButton()
            btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            btn.setImage(UIImage(named: "map"), for: .normal)
            annotationView.rightCalloutAccessoryView = btn
        }
        
        return annotationView
    }
    
    // When user pans across the map, we want to update the map with the Pokemon sightings
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        // Obtain the user's center in lat/long coordinates
        let location = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        // Show the sightings based on user's new updated location after panning
        showSightingsOnMap(location: location)
    }
    
    // Implement behavior when callout accessory control is tapped
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        // Configure map view before it's loaded
        if let anno = view.annotation as? PokeAnnotation {
            let place = MKPlacemark(coordinate: anno.coordinate)
            let destination = MKMapItem(placemark: place)
            destination.name = "Pokemon Sighting"
            let regionDistance: CLLocationDistance = 1000
            let regionSpan = MKCoordinateRegionMakeWithDistance(anno.coordinate, regionDistance, regionDistance)
            
            let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span), MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDefault] as [String: Any]
            
            MKMapItem.openMaps(with: [destination], launchOptions: options)
        }
    }
    
    //MARK: Pokemon Sighting methods
    // Whenever you see a Pokemon, this method is called and sets the location for the specific Pokemon using the PokeID as the key
    func createSighting(forLocation location: CLLocation, withPokemon pokeId: Int) {
        // Call the GeoFire's setLocation method, which stores the location and associated PokeID key
        geoFire.setLocation(location, forKey: "\(pokeId)")
    }
    
    // Whenever we get user's location, we display Pokemon sightings on the map
    func showSightingsOnMap(location: CLLocation) {
        // Create a query at a specific location with specified radius (in km)
        let circleQuery = geoFire!.query(at: location, withRadius: 2.5)
        // Observe whenever we find a sighting
        _ = circleQuery?.observe(GFEventType.keyEntered, with: { (key, location) in
          
            // Optionally unwrapping key and location b/c it could be nil
            if let key = key, let location = location {
                // Create a PokeAnnotation object using the location and pokeID
                let anno = PokeAnnotation(coordinate: location.coordinate, pokeID: Int(key)!)
                self.mapView.addAnnotation(anno)
            }
        })
    }
    
    // When we tap on the Pokeball, this IBAction will add a random Pokemon to the map and will center it on the user's current center location on the map view
    @IBAction func spotRandomPokemon(_ sender: Any) {
        // Get the current center location on the map
        let location = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        // Generate a random integer that corresponds with a PokeID
        let rand = arc4random_uniform(151) + 1
        // Create the sighting and pass in the location and random integer
        createSighting(forLocation: location, withPokemon: Int(rand))
    }
}
