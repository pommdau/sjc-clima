//
//  MenuView.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//

import SwiftUI

struct MenuView: View {
    
    @State var viewModel: MenuViewModel
    @State private var menuOption: MenuOption = .curry
    
    var body: some View {
        menuSelectHeader()
        menuDetails()
    }
}

extension MenuView {
    
    @ViewBuilder
    private func menuSelectHeader() -> some View {
        HStack {
            Picker(selection: $menuOption) {
                ForEach(MenuOption.allCases, id: \.self) { option in
                    Text(option.rawValue).tag(option.rawValue)
                }
            } label: {
                Text("料理名")
            }
            Button("料理をする") {
                viewModel.handleCookButtonTapped(option: menuOption)
            }
        }
    }
    
    @ViewBuilder
    private func menuDetails() -> some View {
        if let menu = viewModel.menu {
            List {
                LabeledContent("メニュー名", value: menu.name)
                LabeledContent("カロリー", value: "\(menu.calorie)kcal")
                LabeledContent {
                    VStack(alignment: .trailing) {
                        ForEach(menu.ingredients, id: \.self) { ingredient in
                            Text("\(ingredient.name)/\(ingredient.calorie)kcal/\(ingredient.isCut ? "カット済" : "未カット")/\(ingredient.isCooked ? "料理済" : "未料理")")
                        }
                    }
                } label: {
                    Text("食材")
                }
                LabeledContent {
                    VStack(alignment: .trailing) {
                        ForEach(menu.seasonings, id: \.self) { seasoning in
                            Text("\(seasoning.name)/\(seasoning.calorie)kcal/\(seasoning.isAdded ? "追加済" : "未追加")")
                        }
                    }
                } label: {
                    Text("調味料")
                }
            }
        } else {
            Text("料理がありません")
                .onAppear {
                    viewModel.handleCookButtonTapped(option: menuOption)
                }
        }
    }
}

#Preview {
    MenuView(viewModel: .init())
}
