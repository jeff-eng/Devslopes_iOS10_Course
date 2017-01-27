//
//  WeatherVC.swift
//  rainyshinycloudy
//
//  Created by Jeffrey Eng on 1/23/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        forecast = Forecast()
        // Calls the downloadWeatherDetails method. Once downloadWeatherDetails completes, updateMainUI is called inside the closure to update the screen with the weather details.
        currentWeather.downloadWeatherDetails {
            self.updateMainUI()
            self.forecast.downloadForecastData {
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Since the forecasts array is a property of the forecast instance above, we have to access it using dot notation and then get the count
        return forecast.forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            
            let forecastFromArray = forecast.forecasts[indexPath.row]
            cell.configureCell(forecast: forecastFromArray)
            return cell
        } else {
            // Returns an empty WeatherCell object in case of failure to retrieve a forecast
            return WeatherCell()
        }
        
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
}

