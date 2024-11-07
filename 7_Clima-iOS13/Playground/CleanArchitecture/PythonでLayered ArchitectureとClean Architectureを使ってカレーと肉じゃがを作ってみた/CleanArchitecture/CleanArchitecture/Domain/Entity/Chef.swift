//
//  Chef.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/07.
//

import Foundation

// MARK: - 料理人

struct Chef {
    var isWaterBoiled: Bool = false
        
    static func cut(ingredients: [Ingredient]) -> [Ingredient] {
        return ingredients.map { ingredient in
            var ingredient = ingredient
            ingredient.isCut = true
            return ingredient
        }
    }
    
    static func cook(ingredients: [Ingredient]) -> [Ingredient] {
        return ingredients.map { ingredient in
            var ingredient = ingredient
            ingredient.isCooked = true
            return ingredient
        }
    }
    
    static func add(seasonings: [Seasoning]) -> [Seasoning] {
        return seasonings.map { seasoning in
            var seasoning = seasoning
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
    
    mutating func cook(ingredients: [Ingredient],
                       seasonings: [Seasoning],
                       option: MenuOption) -> Menu {
        var processedIngredients = ingredients
        processedIngredients = Self.cut(ingredients: ingredients)
        processedIngredients = Self.cook(ingredients: processedIngredients)
        boilWater()
        var processedSeasonings = seasonings
        processedSeasonings = Self.add(seasonings: processedSeasonings)
        let totalCalories = Self.calculateTotalCalories(seasonings: processedSeasonings, ingredients: processedIngredients)
        
        return .init(name: option.rawValue, calorie: totalCalories, ingredients: processedIngredients, seasonings: processedSeasonings)
    }
    
    mutating func boilWater() {
        self.isWaterBoiled = true
    }
}
