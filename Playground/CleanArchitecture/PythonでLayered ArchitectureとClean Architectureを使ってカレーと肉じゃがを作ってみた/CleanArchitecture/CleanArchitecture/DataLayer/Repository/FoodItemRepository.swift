//
//  RepositoryImp.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//
/*
 このような具体的な永続化を隠蔽するためのデザインパターンをRepositoryパターンと呼ぶ

 もう一つDataSourceを間にかませることもある？
 https://medium.com/@nicolasguyot/swiftui-clean-architecture-simplest-example-part-1-ef7be940ecb8
 */

import Foundation

class FoodItemRepository: FoodItemRepositoryProtocol {
    
    func getOnion() -> Ingredient {
        return Ingredient(name: "玉ねぎ", calorie: 20)
    }
    
    func getPotato() -> Ingredient {
        return Ingredient(name: "じゃがいも", calorie: 30)
    }
    
    func getCarrot() -> Ingredient {
        return Ingredient(name: "にんじん", calorie: 40)
    }
    
    func getCurryPowder() -> Seasoning {
        return Seasoning(name: "カレー粉", calorie: 20)
    }
    
    func getSoySauce() -> Seasoning {
        return Seasoning(name: "醤油", calorie: 25)
    }
    
    func getSake() -> Seasoning {
        return Seasoning(name: "料理酒", calorie: 40)
    }
}
