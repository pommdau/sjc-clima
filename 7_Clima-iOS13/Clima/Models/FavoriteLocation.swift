//
//  FavoriteLocation.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/15.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct FavoriteLocation {
    private let uuid = UUID()
    var title: String
    var cityName: String // APIの検索時に利用される値
}

extension FavoriteLocation: Identifiable {
    var id: String { uuid.uuidString }
}
