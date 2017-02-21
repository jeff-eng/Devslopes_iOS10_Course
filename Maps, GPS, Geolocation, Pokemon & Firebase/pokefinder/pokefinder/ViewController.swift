//
//  ViewController.swift
//  pokefinder
//
//  Created by Jeffrey Eng on 2/21/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!

    let locationManager = CLLocationManager()
    var mapHasCenteredOnce = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        mapView.delegate = self
        // Setting the tracking mode to keep centered on user's location
        mapView.userTrackingMode = MKUserTrackingMode.follow
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Call locationAuthStatus method after the View appears
        locationAuthStatus()
    }
    
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
        
        // Create uninstantiated reference of annotation view
        var annotationView: MKAnnotationView?
        
        // If annotation is a User Location annotation, we want to change it
        if annotation.isKind(of: MKUserLocation.self) {
            // Create the instance
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
            // Change the image of the annotation to the sprite image
            annotationView?.image = UIImage(named: "ash")
        }
        
        return annotationView
    }
    
    @IBAction func spotRandomPokemon(_ sender: Any) {
    }
}

