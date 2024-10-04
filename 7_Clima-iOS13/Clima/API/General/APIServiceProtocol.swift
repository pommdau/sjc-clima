//
//  APIServiceProtocol.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import HTTPTypes
import HTTPTypesFoundation

protocol APIServiceProtocol {
    associatedtype APIError: Error, Codable
}

// MARK: - 共通機能

extension APIServiceProtocol {
    func request<Request>(with request: Request) async throws(APIServiceError<APIError>) ->
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
#if DEBUG
        let _responseMessage = String(data: data, encoding: .utf8) ?? "" // swiftlint:disable:this identifier_name
        print(_responseMessage)
#endif
        if !(200..<300).contains(response.status.code) {
            // レスポンスのコードがエラー範囲の場合
            let apiError: APIError
            do {
                apiError = try JSONDecoder().decode(APIError.self, from: data)
            } catch {
                throw APIServiceError.apiResponseParseError(error)
            }
            throw APIServiceError.apiError(apiError)
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
