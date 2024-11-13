//
//  TODOItemRepository.swift
//  TODOList
//
//  Created by HIROKI IKEUCHI on 2024/11/11.
//

import Foundation

struct TODOItemRepository: TODOItemRepositoryProtocol {
        
    var items: [TODOItem] = TODOItem.sampleData
    
    mutating func update(_ item: TODOItem) {
        guard let index = items.firstIndex(where: { item.id == $0.id }) else {
            return
        }
        items[index] = item
    }
    
    mutating func add(_ item: TODOItem) {
        items.append(item)
    }
}
