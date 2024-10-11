//
//  LocationGroup.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/06.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

// MARK: - LocationGroup

struct LocationGroup {
    private let uuid = UUID()
    let name: String
    var locations: [Location]
    var isExpanded: Bool = true
}

extension LocationGroup: Identifiable {
    var id: String { uuid.uuidString }
}

// MARK: - LocationGroup.Location

extension LocationGroup {
    struct Location {
        private let uuid = UUID()
        var title: String
        var city: String // APIの検索時に利用される値
    }
}

extension LocationGroup.Location: Identifiable {
    var id: String { uuid.uuidString }
}

// MARK: - Defined Data

extension LocationGroup {
    static let definedData: [LocationGroup] = [
        .init(name: "EU", locations: [
            .init(title: "ベルリン", city: "berlin"),
            .init(title: "アムステルダム", city: "amsterdam"),
            .init(title: "ロンドン", city: "london"),
        ]),
        .init(name: "アジア", locations: [
            .init(title: "東京", city: "tokyo"),
            .init(title: "バンコク", city: "bangkok"),
        ]),
        .init(name: "オセアニア", locations: [
            .init(title: "シドニー", city: "sydney"),
            .init(title: "メルボルン", city: "melbourne"),
            .init(title: "ロンドン", city: "london"),
        ]),
        .init(name: "アフリカ", locations: [
            .init(title: "ケープタウン", city: "cape town"),
        ])
    ]
}
