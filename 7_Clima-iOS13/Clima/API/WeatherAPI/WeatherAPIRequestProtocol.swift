//
//  WeatherAPIRequestProtocol.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import HTTPTypes

// MARK: - 宣言

protocol WeatherAPIRequestProtocol {}

// MARK: - WeatherAPIRequestの共通部分

extension WeatherAPIRequestProtocol {
        
    var appid: String {
        // WARN: 本来であれば環境変数などで管理すること
        return "4e415e4ab2aaed09e04d8419beedee19"
    }
    
    func createQueryItems(location: WeatherAPIRequest.Location, units: String = "metric") -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        
        // Keyの設定
        queryItems.append(.init(name: "appid", value: appid))
        
        // 検索条件
        switch location {
        case .city(let city):
            queryItems.append(.init(name: "q", value: city))
        case .coordinate(let coordinate):
            queryItems.append(contentsOf: [
                .init(name: "lat", value: "\(coordinate.latitude)"),
                .init(name: "lon", value: "\(coordinate.longitude)")
            ])
        }
        
        // 気温を摂氏で取得
        queryItems.append(.init(name: "units", value: units))
        
        return queryItems
    }
}

// MARK: - APIRequestProtocolにおけるWeatherAPIRequestの共通部分

extension APIRequestProtocol where Self: WeatherAPIRequestProtocol {
    
    typealias Response = WeatherData
    
    var method: HTTPTypes.HTTPRequest.Method {
        .get
    }
    
    var scheme: String {
        "https"
    }
    
    var authority: String {
        "api.openweathermap.org"
    }
        
    var headerFields: HTTPTypes.HTTPFields {
        var headerFields = HTTPTypes.HTTPFields()
        headerFields[.accept] = "application/json"
        return headerFields
    }
    
    var body: Data? {
        nil
    }
}
