//
//  APIService.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/03.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import HTTPTypes

final actor WeatherAPIService {
    static let shared = WeatherAPIService()
    
    /// 天気の取得
    func fetchWeather(for location: WeatherAPIRequest.Location) async throws(APIServiceError<WeatherAPIError>) -> WeatherData {
        let request = WeatherAPIRequest.FetchWeather(location: location)
        let weatherData = try await self.request(with: request)
        
        return weatherData
    }
    
    /// 天気予報の取得
    func fetchForecast(for location: WeatherAPIRequest.Location) async throws(APIServiceError<WeatherAPIError>) -> WeatherData {
        let request = WeatherAPIRequest.FetchForecast(location: location)
        let weatherData = try await self.request(with: request)
        
        return weatherData
    }
}

// MARK: - APIServiceProtocol

extension WeatherAPIService: APIServiceProtocol {
    typealias APIError = WeatherAPIError
}
