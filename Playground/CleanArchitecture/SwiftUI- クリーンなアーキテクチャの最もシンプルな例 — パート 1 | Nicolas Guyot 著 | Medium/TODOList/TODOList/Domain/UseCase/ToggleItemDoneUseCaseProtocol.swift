//
//  MakeItemDoneUseCaseProtocol.swift
//  TODOList
//
//  Created by HIROKI IKEUCHI on 2024/11/11.
//

import Foundation

protocol ToggleItemDoneUseCaseProtocol {    
    var repository: TODOItemRepositoryProtocol { get }
    func fetchItems() -> [TODOItem]
    mutating func toggleDone(_ item: TODOItem)
    mutating func addItem()
}
