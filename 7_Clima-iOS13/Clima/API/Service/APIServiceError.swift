//
//  APIServiceError.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

enum APIServiceError {
    // APIのリクエストの作成に失敗
    case invalidRequest
    
    // 通信に失敗
    case connectionError(Error)
    
    // APIからのレスポンスの変換に失敗
    case apiResponseParseError(Error)
    
    // APIからエラーレスポンスを受け取った
    case apiError(String)
}

// MARK: - LocalizedError

extension APIServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return R.string.localizable.apiServiceErrorInvalidRequest()
        case .connectionError:
            return R.string.localizable.apiServiceErrorConnectionError()
        case .apiResponseParseError:
            return R.string.localizable.apiServiceErrorApiResponseParseError()
        case .apiError(let reason):
            return R.string.localizable.apiServiceErrorApiError(reason)
        }
    }
}
