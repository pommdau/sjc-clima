//
//  IcanhazdadjokeAPIService.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import HTTPTypes

final actor IcanhazdadjokeAPIService {
    static let shared = IcanhazdadjokeAPIService()
    
    func fetchRandomJoke() async throws(APIServiceError<IcanhazdadjokeAPIError>) -> IcanhazdadjokeData {
        let request = IcanhazdadjokeAPIRequest.Random()
        let joke = try await self.request(with: request)
        
        return joke
    }
    
    func fetchJoke(id jokeID: String) async throws(APIServiceError<IcanhazdadjokeAPIError>) -> IcanhazdadjokeData {
        let request = IcanhazdadjokeAPIRequest.Select(jokeID: jokeID)
        let joke = try await self.request(with: request)
        
        return joke
    }
}

// MARK: - APIServiceProtocol

extension IcanhazdadjokeAPIService: APIServiceProtocol {
    typealias APIError = IcanhazdadjokeAPIError
}
