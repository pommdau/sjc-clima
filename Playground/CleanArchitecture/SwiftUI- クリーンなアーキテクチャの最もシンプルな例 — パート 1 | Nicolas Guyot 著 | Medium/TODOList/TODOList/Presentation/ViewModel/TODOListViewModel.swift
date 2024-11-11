//
//  TODOListViewModel.swift
//  TODOList
//
//  Created by HIROKI IKEUCHI on 2024/11/11.
//

import Foundation
import Observation

@Observable
class TODOListViewModel {
    var usecase: ToggleItemDoneUseCaseProtocol
    var items: [TODOItem] = []
    
    init(usecase: ToggleItemDoneUseCaseProtocol = ToggleItemDoneUseCase(repository: TODOItemRepository())) {
        self.usecase = usecase
        self.items = usecase.fetchItems()
    }
    
    func handleToggleDone(item: TODOItem) {
        usecase.toggleDone(item)
        items = usecase.fetchItems()
    }
    
    func handleAddItemButtonTapped() {
        usecase.addItem()
        items = usecase.fetchItems()
    }
}
