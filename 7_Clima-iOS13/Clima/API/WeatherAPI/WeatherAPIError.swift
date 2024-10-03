//
//  WeatherAPIError.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/03.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

/*
 {"cod":"404","message":"city not found"}
 */
struct WeatherAPIError: Error, Codable {
    let cod: String
    let message: String
}

// MARK: - LocalizedError

extension WeatherAPIError: LocalizedError {
    public var errorDescription: String? {
        return message
    }
}
