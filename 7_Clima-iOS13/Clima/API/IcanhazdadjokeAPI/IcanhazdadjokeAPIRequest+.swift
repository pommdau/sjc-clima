//
//  IcanhazdadjokeAPIRequest+.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

extension IcanhazdadjokeAPIRequest {
    struct Random: IcanhazdadjokeAPIRequestProtocol, APIRequestProtocol {}
}

extension IcanhazdadjokeAPIRequest {
    struct Select: IcanhazdadjokeAPIRequestProtocol, APIRequestProtocol {
        let jokeID: String // e.g. "R7UfaahVfFd"
        
        var path: String {
            "/j/\(jokeID)"
        }
    }
}
