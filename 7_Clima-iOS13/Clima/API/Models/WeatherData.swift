//
//  WeatherData.swift
//  Clima
//
//  Created by Daegeon Choi on 2020/04/23.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    struct Main: Codable {
        let temp: Double
    }
    
    struct Weather: Codable {
        let id: Int
        let description: String
    }

    let name: String
    let main: Main
    let weather: [Weather]
}
