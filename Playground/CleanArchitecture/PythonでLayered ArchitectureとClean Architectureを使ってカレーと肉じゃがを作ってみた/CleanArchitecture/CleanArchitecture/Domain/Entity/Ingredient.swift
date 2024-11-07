//
//  Ingredient.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/07.
//

import Foundation

// MARK: - 食材

struct Ingredient: Hashable {
    let name: String
    let calorie: Int
    var isCut: Bool = false
    var isCooked: Bool = false
}
