//
//  Interactor.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//

import Foundation

struct DataFetcher {
    let repository: IRepository
    var ingredients: [Ingredient] = []
    var seasonings: [Seasoning] = []
    
    mutating func fetch(option: MenuOption) {
        switch option {
        case .curry:
            self.ingredients = [
                repository.getCarrot(),
                repository.getPotato(),
                repository.getOnion(),
            ]
            self.seasonings = [
                repository.getCurryPowder(),
            ]
        case .nikujaga:
            self.ingredients = [
                repository.getCarrot(),
                repository.getPotato(),
                repository.getOnion(),
            ]
            self.seasonings = [
                repository.getSake(),
                repository.getSoySauce(),
            ]
        }
    }
}

// IInteractorとは？
struct CreateMenuUseCase: IUseCase {
    
    let repository: IRepository
    
    func execute(option: MenuOption) throws(UseCaseError) -> Menu {
        var dataFetcher = DataFetcher(repository: repository)
        dataFetcher.fetch(option: option)
        var chef = Chef()
        return chef.cook(
            ingredients: dataFetcher.ingredients,
            seasonings: dataFetcher.seasonings,
            option: option
        )
    }
}
