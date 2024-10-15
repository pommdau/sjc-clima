//
//  FavoriteLocationGroup.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/06.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

// MARK: - LocationGroup

struct FavoriteLocationGroup {
    private let uuid = UUID()
    let name: String
    var locations: [FavoriteLocation]
    var isExpanded: Bool = true
}

extension FavoriteLocationGroup: Identifiable {
    var id: String { uuid.uuidString }
}

// MARK: - Defined Data

extension FavoriteLocationGroup {
    static let defined: [FavoriteLocationGroup] = [
        .init(name: R.string.localizable.favoriteLocationGroupDefinedEu(), locations: [
            .init(title: R.string.localizable.favoriteLocationGroupDefinedBerlin(), cityName: "berlin"),
            .init(title: R.string.localizable.favoriteLocationGroupDefinedAmsterdam(), cityName: "amsterdam"),
            .init(title: R.string.localizable.favoriteLocationGroupDefinedLondon(), cityName: "london"),
        ]),
        .init(name: R.string.localizable.favoriteLocationGroupDefinedAsia(), locations: [
            .init(title: R.string.localizable.favoriteLocationGroupDefinedTokyo(), cityName: "tokyo"),
            .init(title: R.string.localizable.favoriteLocationGroupDefinedBangkok(), cityName: "bangkok"),
        ]),
        .init(name: R.string.localizable.favoriteLocationGroupDefinedOceania(), locations: [
            .init(title: R.string.localizable.favoriteLocationGroupDefinedSydney(), cityName: "sydney"),
            .init(title: R.string.localizable.favoriteLocationGroupDefinedMelbourne(), cityName: "melbourne"),
            .init(title: R.string.localizable.favoriteLocationGroupDefinedLondon(), cityName: "london"),
        ]),
        .init(name: R.string.localizable.favoriteLocationGroupDefinedAfrica(), locations: [
            .init(title: R.string.localizable.favoriteLocationGroupDefinedCapeTown(), cityName: "cape town"),
        ])
    ]
}
