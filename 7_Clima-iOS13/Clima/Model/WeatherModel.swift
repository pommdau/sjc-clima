//
//  WeatherModel.swift
//  Clima
//
//  Created by Daegeon Choi on 2020/04/28.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import SFSafeSymbols

struct WeatherModel {
    let cityName: String
    let conditionId: Int
    let temperature: Double
    
    var temperatureString: String {
        String(format: "%.1f", temperature)
    }
    
    // computed property
    var conditionSymbol: SFSymbol {
        // docs https://openweathermap.org/weather-conditions
        switch conditionId / 100 {
        case 2:
            return SFSymbol.cloudBolt
        case 3:
            return SFSymbol.cloudDrizzle
        case 5:
            return SFSymbol.cloudRain
        case 6:
            return SFSymbol.cloudSnow
        case 7:
            return SFSymbol.cloudFog
        case 8:
            if conditionId == 800 {
                return SFSymbol.sunMax
            } else {
                return SFSymbol.cloudBolt
            }
        default:
            return SFSymbol.cloud
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
    static let berlin = WeatherModel(cityName: R.string.localizable.favoriteLocationGroupDefinedBerlin(), conditionId: 200, temperature: 12.22)
    static let tokyo = WeatherModel(cityName: R.string.localizable.favoriteLocationGroupDefinedTokyo(), conditionId: 800, temperature: 20.99)
}
