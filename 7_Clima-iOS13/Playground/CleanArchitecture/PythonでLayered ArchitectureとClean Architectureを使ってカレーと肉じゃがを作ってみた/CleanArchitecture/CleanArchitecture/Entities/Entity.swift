//
//  Entity.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//

import Foundation

// MARK: - 食材

struct Ingredient: Hashable {
    let name: String
    let calorie: Int
    var isCut: Bool = false
    var isCooked: Bool = false
}

// MARK: - 調味料

struct Seasoning: Hashable {
    let name: String
    let calorie: Int
    var isAdded: Bool = false
}

// MARK: - 料理

struct Menu {
    let name: String
    let calorie: Int
    let ingredients: [Ingredient]
    let seasonings: [Seasoning]
}

// MARK: 料理の定義

enum MenuOption: String, CaseIterable {
    case curry = "カレー"
    case nikujaga = "肉じゃが"
}

// MARK: - 料理人

struct Chef {
    var isWaterBoiled: Bool = false
    
    mutating func cook(ingredients: [Ingredient],
                       seasonings: [Seasoning],
                       option: MenuOption) -> Menu {
        var processedIngredients = ingredients
        processedIngredients = Chef.cut(ingredients: ingredients)
        processedIngredients = Chef.cook(ingredients: processedIngredients)
        boilWater()
        var processedSeasonings = seasonings
        processedSeasonings = Chef.add(seasonings: processedSeasonings)
        let totalCalories = Chef.calculateTotalCalories(seasonings: processedSeasonings, ingredients: processedIngredients)
        
        return .init(name: option.rawValue, calorie: totalCalories, ingredients: processedIngredients, seasonings: processedSeasonings)
    }
    
    static func cut(ingredients: [Ingredient]) -> [Ingredient] {
        return ingredients.map { _ingredient in
            var ingredient = _ingredient
            ingredient.isCut = true
            return ingredient
        }
    }
    
    static func cook(ingredients: [Ingredient]) -> [Ingredient] {
        return ingredients.map { _ingredient in
            var ingredient = _ingredient
            ingredient.isCooked = true
            return ingredient
        }
    }
    
    static func add(seasonings: [Seasoning]) -> [Seasoning] {
        return seasonings.map { _seasoning in
            var seasoning = _seasoning
            seasoning.isAdded = true
            return seasoning
        }
    }
    
    static func calculateTotalCalories(
        seasonings: [Seasoning],
        ingredients: [Ingredient]
    ) -> Int {
        let sumOfSeasonings = seasonings.reduce(0) { partialResult, seasoning in
            partialResult + seasoning.calorie
        }
        let sumOfIngredients = ingredients.reduce(0) { partialResult, ingredient in
            partialResult + ingredient.calorie
        }
        
        return sumOfSeasonings + sumOfIngredients
    }
    
    mutating func boilWater() {
        self.isWaterBoiled = true
    }
}
