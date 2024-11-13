//
//  MakeItemDoneUseCase.swift
//  TODOList
//
//  Created by HIROKI IKEUCHI on 2024/11/11.
//

import SwiftUI

struct ToggleItemDoneUseCase: ToggleItemDoneUseCaseProtocol {
    
    var repository: TODOItemRepositoryProtocol
    
    init(repository: TODOItemRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - CRUD
    
    // MARK: Create
    
    mutating func addItem() {
        let index = repository.items.count + 1
        let item = TODOItem(name: "Item\(index)", isDone: false)
        repository.add(item)
    }
    
    // MARK: Read
    
    func fetchItems() -> [TODOItem] {
        return repository.items
    }
    
    // MARK: Update
    
    mutating func toggleDone(_ item: TODOItem) {
        var item = item
        item.isDone.toggle()
        repository.update(item)
    }
}
