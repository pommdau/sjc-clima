//
//  Menu.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/07.
//

import Foundation

// MARK: - 料理

struct Menu {
    let name: String
    let calorie: Int
    let ingredients: [Ingredient]
    let seasonings: [Seasoning]
}
