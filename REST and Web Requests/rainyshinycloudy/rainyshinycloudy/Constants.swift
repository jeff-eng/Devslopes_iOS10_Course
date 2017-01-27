//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Jeffrey Eng on 1/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="

// Tells function downloadWeatherDetails when complete, in other words when finished downloading
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=-36&lon=123&cnt=10&mode=json&appid=81151a9300b500142e19bf5a1e796e3c"

