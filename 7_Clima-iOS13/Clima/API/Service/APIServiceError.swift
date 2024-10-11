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
            return "APIリクエストの作成に失敗しました"
        case .connectionError:
            return "通信エラーが発生しました"
        case .apiResponseParseError:
            return "データの取得に失敗しました"
        case .apiError(let reason):
            return "APIでエラーが発生しました\n\(reason)"
        }
    }
}
