//
//  APIService.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/11.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import HTTPTypes
import HTTPTypesFoundation

final actor APIService {
    
    static let shared = APIService()
    
    private func request<Request>(with request: Request) async throws(APIServiceError) ->
    Request.Response where Request: APIRequestProtocol {
        // リクエストの送信
        guard let httpRequest = request.buildHTTPRequest() else {
            throw APIServiceError.invalidRequest
        }
        let (data, response): (Data, HTTPResponse)
        do {
            (data, response) = try await URLSession.shared.data(for: httpRequest)
        } catch {
            throw APIServiceError.connectionError(error)
        }
        
        // レスポンスへのハンドリング
        if !(200..<300).contains(response.status.code) {
            // レスポンスのコードがエラー範囲の場合
            let reason = String(data: data, encoding: .utf8) ?? ""
            throw APIServiceError.apiError(reason)
        }
        
        // レスポンスをデータモデルへデコード
        do {
            let result = try JSONDecoder().decode(Request.Response.self, from: data)
            return result
        } catch {
            throw APIServiceError.apiResponseParseError(error)
        }
    }
}

// MARK: - Call API

extension APIService {
    /// 天気の取得
    func fetchWeather(for location: WeatherAPIRequest.Location) async throws(APIServiceError) -> WeatherData {
        let request = WeatherAPIRequest(location: location)
        let weatherData = try await self.request(with: request)
        return weatherData
    }
    
    /// jokeの取得
    func fetchRandomJoke() async throws(APIServiceError) -> IcanhazdadjokeData {
        let request = IcanhazdadjokeAPIRequest()
        let joke = try await self.request(with: request)
        return joke
    }
}
