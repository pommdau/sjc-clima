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
        var name: String
    }
}

extension LocationGroup.Location: Identifiable {
    var id: String { uuid.uuidString }
}

// MARK: - Defined Data

extension LocationGroup {
    static let definedData: [LocationGroup] = [
        .init(name: "EU", locations: [
            .init(name: "ベルリン"),
            .init(name: "アムステルダム"),
            .init(name: "ロンドン"),
        ]),
        .init(name: "アジア", locations: [
            .init(name: "東京"),
            .init(name: "バンコク"),
        ]),
        .init(name: "オセアニア", locations: [
            .init(name: "シドニー"),
            .init(name: "メルボルン"),
            .init(name: "ロンドン"),
        ]),
        .init(name: "アフリカ", locations: [
            .init(name: "ケープタウン"),
        ])
    ]
}
