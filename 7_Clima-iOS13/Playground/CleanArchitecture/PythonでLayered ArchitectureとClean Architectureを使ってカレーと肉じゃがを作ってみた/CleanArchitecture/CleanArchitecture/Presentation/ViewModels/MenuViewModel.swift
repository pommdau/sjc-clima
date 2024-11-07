//
//  MenuViewModel.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//

import Foundation
 
struct MenuViewModel {
    private var usecase: IUseCase
    private(set) var menu: Menu?
    
    init(usecase: IUseCase = CreateMenuUseCase(repository: Repository()),
         menu: Menu? = nil) {
        self.usecase = usecase
        self.menu = menu
    }
    
    mutating func handleCookButtonTapped(option: MenuOption) {
        do {
            self.menu = try usecase.execute(option: option)
        } catch {
            print(error.localizedDescription)
        }
    }
}
