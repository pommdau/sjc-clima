//
//  APIRequestProtocol.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/03.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import HTTPTypes

protocol APIRequestProtocol {
    associatedtype Response: Decodable
    var method: HTTPRequest.Method { get }
    var scheme: String { get } // e.g. "https"
    var authority: String { get } // e.g. "www.example.com"
    var path: String { get } // e.g. "/"
    var queryItems: [URLQueryItem] { get }
    var headerFields: HTTPFields { get }
    var body: Data? { get }
}

// MARK: - 共通機能

extension APIRequestProtocol {
    /// クエリパラメータが付与されていないURL
    var baseURL: URL? {
        HTTPRequest(
            method: method,
            scheme: scheme,
            authority: authority,
            path: path,
            headerFields: .init()
        ).url
    }
    
    /// クエリパラメータが付与されたURL
    var url: URL? {
        guard
            let baseURL,
            var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        else {
            return nil
        }
        components.queryItems = queryItems
        
        return components.url
    }

    func buildHTTPRequest() -> HTTPRequest? {
        guard let url else {
            return nil
        }
        return HTTPRequest(
            method: method,
            url: url,
            headerFields: headerFields
        )
    }
}
