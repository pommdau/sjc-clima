//
//  WeatherAPIRequest.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import HTTPTypes

// MARK: - APIRequestProtocol

extension WeatherAPIRequest: APIRequestProtocol {
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
    
    var path: String {
        "/data/2.5/weather"
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        
        // WARN: 本来であれば環境変数などでセキュアに管理すること
        queryItems.append(.init(name: "appid", value: "4e415e4ab2aaed09e04d8419beedee19"))
        
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
        
        // 気温の取得単位の設定(metric: 摂氏)
        queryItems.append(.init(name: "units", value: "metric"))
        
        return queryItems
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
