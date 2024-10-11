//
//  WeatherModel.swift
//  Clima
//
//  Created by Daegeon Choi on 2020/04/28.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let cityName: String
    let conditionId: Int
    let temperature: Double
    
    var temperatureString: String {
        String(format: "%.1f", temperature)
    }
    
    // computed property
    var conditionName: String {
        // docs https://openweathermap.org/weather-conditions
        switch conditionId / 100 {
        case 2:
            return "cloud.bolt"
        case 3:
            return "cloud.drizzle"
        case 5:
            return "cloud.rain"
        case 6:
            return "cloud.snow"
        case 7:
            return "cloud.fog"
        case 8:
            if conditionId == 800 {
                return "sun.max"
            } else {
                return "cloud.bolt"
            }
        default:
            return "cloud"
        }
    }
    
    init(cityName: String, conditionId: Int, temperature: Double) {
        self.cityName = cityName
        self.conditionId = conditionId
        self.temperature = temperature
    }
    
    init(from data: WeatherData) {
        self.cityName = data.name
        self.conditionId = data.weather[0].id
        self.temperature = data.main.temp
    }
}

// MARK: - SampleData

extension WeatherModel {
    static let berlin = WeatherModel(cityName: "Berlin", conditionId: 200, temperature: 12.22)
    static let tokyo = WeatherModel(cityName: "Tokyo", conditionId: 800, temperature: 20.99)
}
