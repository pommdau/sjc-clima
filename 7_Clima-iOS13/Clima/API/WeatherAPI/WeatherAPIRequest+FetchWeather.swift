//
//  WeatherAPIRequest+FetchWeather.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

extension WeatherAPIRequest {
    struct FetchWeather {
        let location: Location
    }
}

// MARK: - APIRequestProtocol

extension WeatherAPIRequest.FetchWeather: WeatherAPIRequestProtocol { }

// MARK: - APIRequestProtocol

extension WeatherAPIRequest.FetchWeather: APIRequestProtocol {
    var path: String {
        "/data/2.5/weather"
    }
    
    var queryItems: [URLQueryItem] {
        createQueryItems(location: location)
    }
}
