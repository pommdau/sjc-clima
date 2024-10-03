//
//  WeatherAPIRequest.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

// 名前空間の定義
enum WeatherAPIRequest {}

// MARK: - Defines

extension WeatherAPIRequest {    
    struct Coordinate {
        var latitude: Double
        var longitude: Double
    }
    
    enum Location {
        case city(String)
        case coordinate(Coordinate)
    }
}
