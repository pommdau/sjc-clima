//
//  WeatherAPIRequest+FetchForecast.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

extension WeatherAPIRequest {
    struct FetchForecast {
        let location: Location
    }
}

// MARK: - APIRequestProtocol

extension WeatherAPIRequest.FetchForecast: WeatherAPIRequestProtocol { }

// MARK: - APIRequestProtocol

extension WeatherAPIRequest.FetchForecast: APIRequestProtocol {
    var path: String {
        "/data/2.5/forecast"
    }
    
    var queryItems: [URLQueryItem] {
        createQueryItems(location: location)
    }
}
