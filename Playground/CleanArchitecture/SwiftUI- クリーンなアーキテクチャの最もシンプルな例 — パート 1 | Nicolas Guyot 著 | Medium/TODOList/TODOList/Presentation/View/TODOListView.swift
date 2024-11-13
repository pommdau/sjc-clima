//
//  TODOListView.swift
//  TODOList
//
//  Created by HIROKI IKEUCHI on 2024/11/11.
//

import SwiftUI

struct TODOListView: View {
    
    @State private var viewModel = TODOListViewModel(
        usecase: ToggleItemDoneUseCase(
            repository: TODOItemRepository()
        )
    )
        
    var body: some View {
        
        HStack {
            Spacer()
            Button("Check Repository") {
                for item in viewModel.usecase.repository.items {
                    print(item)
                }
            }
            Button("Add") {
                viewModel.handleAddItemButtonTapped()
            }
            .padding(.trailing, 40)
        }
        
        List($viewModel.items) { $item in
            Toggle(item.name, isOn: $item.isDone)
                .onChange(of: item.isDone) { oldValue, newValue in
                    viewModel.handleToggleDone(item: item)
                }
        }
    }
}


#Preview {
    TODOListView()
}
