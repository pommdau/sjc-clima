//
//  MenuViewModel.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//

import Foundation
 
struct MenuViewModel {
    private var createMenuUsecase: CreateMenuUseCaseProtocol
    private(set) var menu: Menu?
    
    init(usecase: CreateMenuUseCaseProtocol = CreateMenuUseCase(repository: FoodItemRepository()),
         menu: Menu? = nil) {
        self.createMenuUsecase = usecase
        self.menu = menu
    }
    
    mutating func handleCookButtonTapped(option: MenuOption) {
        do {
            self.menu = try createMenuUsecase.cook(option: option)
        } catch {
            print(error.localizedDescription)
        }
    }
}
