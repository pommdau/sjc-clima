//
//  CreateMenuUseCase.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//

import Foundation

private struct DataFetcher {
    let repository: FoodItemRepositoryProtocol
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

struct CreateMenuUseCase: CreateMenuUseCaseProtocol {
    
    let repository: FoodItemRepositoryProtocol
    
    func cook(option: MenuOption) throws(CreateMenuUseCaseError) -> Menu {
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
