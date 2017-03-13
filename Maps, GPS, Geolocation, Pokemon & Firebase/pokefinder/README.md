# PokeFinder

This repository follows the Devslopes tutorial building an app similar to PokeRadar. The app allows the user to create a Pokemon sighting on a map, then get directions to the sighting.

## Features
* When panning, the Map updates with the Pokemon sightings within its view.
* Long-pressing on a specific location on the Map to initiate creation of Pokemon Sighting.
* Swiping down from the Pokemon selection screen to dismiss the screen.
* Launching Apple Maps navigation from the created Pokemon sighting.
* Creating an animation to hint to user to swipe down on Pokemon Selection screen.

## Concepts learned/practiced
* MapKit
  * Creating Annotations and Annotation Views
  * Replacing default pins with custom images for the Annotations
  * Obtaining user permission to use their location
* Core Location
  * ```CLLocationManager```
* Long Press Gesture Recognizer
  * Creating annotation with long press at the location where the user long-pressed
* Using delegate protocol pattern to pass data and share state between View Controllers.
  * Creating delegate protocol
*  Swiping down on a View Controller to dismiss
  * Pan Gesture Recognizer
  * Creating animations for the custom transitions
  * Overriding the default dismissal transition animation using a **transitioning delegate**
* Notification Center events
  * Subscribing to events such as when keyboard is shown and keyboard is hidden so we can respond accordingly
* Installing and using Cocoapods
  * Firebase and GeoFire
* Using Firebase for storing and retrieving location data
* Collection Views

## Attributions
Providing credit to the resources used in implementing certain features.
* [Tapping on View to dismiss keyboard]( https://grokswift.com/dismissing-the-ios-keyboard-when-user-taps-off-of-it/)
* [Using delegate protocol to pass data from one View Controller to another](https://useyourloaf.com/blog/unwind-segues-as-an-alternative-to-delegation/)
* [Creating CLLocation Object from CLLocationCoordinate2D lat/long properties](http://stackoverflow.com/questions/26871750/put-cllocationcoordinate2d-into-cllocation-for-swift)
* [Trigger segue on long-press](http://stackoverflow.com/questions/37803091/triggering-push-segue-from-long-press-on-map-view)
* [Swiping down on a View Controller to dismiss](https://www.thorntech.com/2016/02/ios-tutorial-close-modal-dragging/)
