//
//  IcanhazdadjokeAPIRequest.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/03.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import HTTPTypes

// https://icanhazdadjoke.com/api
protocol IcanhazdadjokeAPIRequestProtocol {}

extension APIRequestProtocol where Self: IcanhazdadjokeAPIRequestProtocol {
    
    typealias Response = IcanhazdadjokeData
    
    var method: HTTPTypes.HTTPRequest.Method {
        .get
    }
    
    var scheme: String {
        "https"
    }
    
    var authority: String {
        "icanhazdadjoke.com"
    }
    
    var path: String {
        "/"
    }
    
    var queryItems: [URLQueryItem] {
        []
    }
    
    var headerFields: HTTPTypes.HTTPFields {
        var headerFields = HTTPTypes.HTTPFields()
        headerFields[.accept] = "application/json"
        headerFields[.userAgent] = "https://github.com/pommdau/sjc-clima"
        return headerFields
    }
    
    var body: Data? {
        nil
    }
}
