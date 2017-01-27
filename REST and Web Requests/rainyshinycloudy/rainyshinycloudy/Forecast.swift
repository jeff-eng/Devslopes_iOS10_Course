//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Jeffrey Eng on 1/26/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    // MARK: Private Variables
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: String!
    private var _lowTemp: String!
    
    // MARK: Forecast Objects array
    var forecasts = [Forecast]()
    
    // MARK: Getters
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    // MARK: Methods
    func parseData(from weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                self._lowTemp = "\(roundToTenths(min.toFahrenheit))"
            }
            
            if let max = temp["max"] as? Double {
                self._highTemp = "\(roundToTenths(max.toFahrenheit))"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        //Downloading forecast weather data using Alamofire for the table view using GET request, followed by a closure
        Alamofire.request(FORECAST_URL).responseJSON { response in
            let result = response.result
            
            // Optionally unwrap the returning JSON and cast as a dictionary for parsing
            if let dict = result.value as? Dictionary<String, AnyObject> {
                // Access the list dictionary for this JSON and optionally unwrap it
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast()
                        forecast.parseData(from: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                }
            }
            completed()
        }
    }
}

