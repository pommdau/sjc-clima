//
//  WeatherAPIRequest+Location.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/11.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherAPIRequest {
    
    struct Coordinate {
        var latitude: Double
        var longitude: Double
    }
    
    enum Location {
        case city(String)
        case coordinate(Coordinate)
    }
    
    let location: Location
}
