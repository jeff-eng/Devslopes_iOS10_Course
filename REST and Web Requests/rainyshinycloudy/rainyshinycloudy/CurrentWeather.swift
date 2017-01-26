//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Jeffrey Eng on 1/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    // MARK: Private Variables
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    // MARK: Getters
    // Best practice - Using data encapsulation here to prevent outside classes from manipulating data.
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    // MARK: Method(s)
    func downloadWeatherDetails(completed: DownloadComplete) {
        //Download Current Weather Data using GET request, followed by a closure
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            // Optionally unwrap the returning JSON and cast as a dictionary
            if let dict = result.value as? Dictionary<String, AnyObject> {
                // Look thru dictionary for the key 'name' and optionally unwrap the value as a String
                if let name = dict["name"] as? String {
                    // Set the city name property to the value retrieved from the key 'name'
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                // Look thru dictionary for key 'weather' and optionally unwrap, then cast as an array of Dictionaries since that is how the JSON is structured
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    // The key 'weather' returns a value of an array of dictionaries, so we have to access that array, then retrieve the value for the key 'main'
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                // Get the dictionary with key 'main' that contains dictionaries, optionally unwrap and cast as a dictionary
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    // Access the dictionary with the key 'temp', optionally unwrap and cast as a Double
                    if let currentTemperature = main["temp"] as? Double {
                        // convert the value using the convertKelvinToFahrenheit method
                        let kelvinToFahrenheit = self.convertKelvinToFahrenheit(kelvinValue: currentTemperature)
                        // Set the currentTemp property to the Fahrenheit value
                        self._currentTemp = kelvinToFahrenheit
                        print(self._currentTemp)
                    }
                }
            }
        }
        completed()
    }
    
    // Separate method to convert kelvin to fahrenheit and round to nearest tenth
    private func convertKelvinToFahrenheit(kelvinValue: Double) -> Double {
        let fahrenheitRawValue = kelvinValue * (9/5) - 459.67
        let fahrenheitRoundedValue = Double(round(10 * fahrenheitRawValue)/10)
        return fahrenheitRoundedValue
    }
}
