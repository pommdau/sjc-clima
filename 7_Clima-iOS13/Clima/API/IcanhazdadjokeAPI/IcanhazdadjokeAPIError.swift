//
//  IcanhazdadjokeAPIError.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

/*
 {
   "message": "The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.",
   "status": 404
 }
 */
struct IcanhazdadjokeAPIError: Error, Codable {
    let status: Int
    let message: String
}

// MARK: - LocalizedError

extension IcanhazdadjokeAPIError: LocalizedError {
    public var errorDescription: String? {
        return message
    }
}
