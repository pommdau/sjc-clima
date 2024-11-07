//
//  DevFoodItemRepository.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/07.
//

import Foundation

class DevFoodItemRepository: FoodItemRepositoryProtocol {
    
    func getOnion() -> Ingredient {
        return Ingredient(name: "onion", calorie: -20)
    }
    
    func getPotato() -> Ingredient {
        return Ingredient(name: "potato", calorie: -30)
    }
    
    func getCarrot() -> Ingredient {
        return Ingredient(name: "carrot", calorie: -40)
    }
    
    func getCurryPowder() -> Seasoning {
        return Seasoning(name: "curry_powder", calorie: -20)
    }
    
    func getSoySauce() -> Seasoning {
        return Seasoning(name: "soy_sauce", calorie: -25)
    }
    
    func getSake() -> Seasoning {
        return Seasoning(name: "sake", calorie: -40)
    }
}
