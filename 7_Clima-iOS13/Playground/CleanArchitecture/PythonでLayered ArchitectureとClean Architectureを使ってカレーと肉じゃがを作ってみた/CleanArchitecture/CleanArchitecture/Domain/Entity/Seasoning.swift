//
//  Seasoning.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/07.
//

import Foundation

// MARK: - 調味料

struct Seasoning: Hashable {
    let name: String
    let calorie: Int
    var isAdded: Bool = false
}
