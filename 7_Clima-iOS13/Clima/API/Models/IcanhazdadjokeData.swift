//
//  IcanhazdadjokeData.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

/*
 {
     "id": "FdFYvkGlysc",
     "joke": "Waking up this morning was an eye-opening experience.",
     "status": 200
 }
 */
struct IcanhazdadjokeData: Codable {
    let status: Int
    let id: String
    let joke: String
}
