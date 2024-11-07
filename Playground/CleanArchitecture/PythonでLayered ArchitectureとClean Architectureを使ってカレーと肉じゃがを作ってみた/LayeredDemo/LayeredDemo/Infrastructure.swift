//
//  Infrastructure.swift
//  LayeredDemo
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//
/*
 データ取得担当: 料理を作るのに必要なデータを取得してくる
 */

import Foundation

// 食材の種別
enum FoodType: String {
    case seasoning = "seasoning"
    case ingredient = "ingredient"
}

// 食材データのデータ構造
struct FoodData {
    let name: String
    let calorie: Int
    let type: FoodType
}

// インフラストラクチャークラス
class Infrastructure {
    
    func getOnion() -> FoodData {
        let data = ["food_name": "onion", "food_calorie": 20] as [String: Any]
        return FoodData(
            name: data["food_name"] as! String,
            calorie: data["food_calorie"] as! Int,
            type: .ingredient
        )
    }

    func getPotato() -> FoodData {
        let data = ["food_name": "potato", "food_calorie": 30] as [String: Any]
        return FoodData(
            name: data["food_name"] as! String,
            calorie: data["food_calorie"] as! Int,
            type: .ingredient
        )
    }

    func getCarrot() -> FoodData {
        let data = ["food_name": "carrot", "food_calorie": 40] as [String: Any]
        return FoodData(
            name: data["food_name"] as! String,
            calorie: data["food_calorie"] as! Int,
            type: .ingredient
        )
    }

    func getChicken() -> FoodData {
        let data = ["food_name": "chicken", "food_calorie": 100] as [String: Any]
        return FoodData(
            name: data["food_name"] as! String,
            calorie: data["food_calorie"] as! Int,
            type: .ingredient
        )
    }

    func getCurryPowder() -> FoodData {
        let data = ["food_name": "curry_powder", "food_calorie": 20] as [String: Any]
        return FoodData(
            name: data["food_name"] as! String,
            calorie: data["food_calorie"] as! Int,
            type: .seasoning
        )
    }

    func getSoySauce() -> FoodData {
        let data = ["food_name": "soy_sauce", "food_calorie": 25] as [String: Any]
        return FoodData(
            name: data["food_name"] as! String,
            calorie: data["food_calorie"] as! Int,
            type: .seasoning
        )
    }

    func getSake() -> FoodData {
        let data = ["food_name": "sake", "food_calorie": 40] as [String: Any]
        return FoodData(
            name: data["food_name"] as! String,
            calorie: data["food_calorie"] as! Int,
            type: .seasoning
        )
    }
}
