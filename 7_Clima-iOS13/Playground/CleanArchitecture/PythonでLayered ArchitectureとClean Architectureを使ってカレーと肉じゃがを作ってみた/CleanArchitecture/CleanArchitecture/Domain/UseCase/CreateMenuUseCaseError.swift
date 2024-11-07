//
//  UseCaseError.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/07.
//

import Foundation

enum CreateMenuUseCaseError: Error {
    case networkError, decodingError, undefinedError
}
