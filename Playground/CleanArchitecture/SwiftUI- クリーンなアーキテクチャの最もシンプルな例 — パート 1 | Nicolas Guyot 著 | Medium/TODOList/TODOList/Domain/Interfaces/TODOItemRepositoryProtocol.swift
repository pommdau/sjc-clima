//
//  TODOItemRepositoryProtocol.swift
//  TODOList
//
//  Created by HIROKI IKEUCHI on 2024/11/11.
//

import Foundation

protocol TODOItemRepositoryProtocol {
    var items: [TODOItem] { get set }
    mutating func update(_ item: TODOItem)
    mutating func add(_ item: TODOItem)
}
