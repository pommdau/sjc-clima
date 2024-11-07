//
//  Domain.swift
//  LayeredDemo
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//
/*
 Domain
 ドメイン担当: 料理の作り方、カロリーの計算方法などビジナスロジックに紐づいた箇所を担当
 
 ここの層で作成したいのは料理を作るためのデータ構造やビジネスロジックをコードで表現することです。
 */

import Foundation

enum MenuOption: String {
    case curry = "curry"
    case nikujyaga = "nikujyaga"
}

// 食材データクラス
struct Ingredient {
    var name: String
    var calorie: Int
    var isCut: Bool = false
    var isCooked: Bool = false
}

// 調味料データクラス
struct Seasoning {
    var name: String
    var calorie: Int
    var isAdded: Bool = false
}

// カレーデータクラス
struct Curry {
    let name = "curry"
    var calorie: Int
    var ingredients: [Ingredient]
    var seasonings: [Seasoning]
}

// 肉じゃがデータクラス
struct Nikujyaga {
    let name = "nikujyaga"
    var calorie: Int
    var ingredients: [Ingredient]
    var seasonings: [Seasoning]
}

// データ取得クラス
class DataFetcher {
    var infrastructure = Infrastructure()
    var ingredients: [Ingredient] = []
    var seasonings: [Seasoning] = []

    // 呼び出し関数
    func fetch(menu: MenuOption) throws -> ([Ingredient], [Seasoning]) {
        switch menu {
        case .curry:
            fetchCurryIngredient()
        case .nikujyaga:
            fetchNikujyagaIngredient()
        }
        return (ingredients, seasonings)
    }

    // カレーデータ取得
    private func fetchCurryIngredient() {
        fetchCommonIngredient()
        fetchData(getFunc: infrastructure.getCurryPowder)
    }

    // 肉じゃがデータ取得
    private func fetchNikujyagaIngredient() {
        fetchCommonIngredient()
        fetchData(getFunc: infrastructure.getSake)
        fetchData(getFunc: infrastructure.getSoySauce)
    }

    // 共通データ取得
    private func fetchCommonIngredient() {
        fetchData(getFunc: infrastructure.getCarrot)
        fetchData(getFunc: infrastructure.getPotato)
        fetchData(getFunc: infrastructure.getOnion)
        fetchData(getFunc: infrastructure.getChicken)
    }

    // データ取得共通処理
    private func fetchData(getFunc: () -> FoodData) {
        let data = getFunc()
        switch data.type {
        case .ingredient:
            ingredients.append(Ingredient(name: data.name, calorie: data.calorie))
        case .seasoning:
            seasonings.append(Seasoning(name: data.name, calorie: data.calorie))
        }
    }
}

// 料理クラス
class Chef {
    var isWaterBoiled: Bool = false

    // 料理をする
    func cookMenu(ingredients: [Ingredient], seasonings: [Seasoning], menu: MenuOption) -> Any {
        var ingredients = ingredients
        var seasonings = seasonings

        cutIngredient(&ingredients)
        cookIngredient(&ingredients)
        boilWater()
        addSeasoning(&seasonings)
        let totalCalorie = calcTotalCalorie(ingredients: ingredients, seasonings: seasonings)

        switch menu {
        case .curry:
            return Curry(calorie: totalCalorie, ingredients: ingredients, seasonings: seasonings)
        case .nikujyaga:
            return Nikujyaga(calorie: totalCalorie, ingredients: ingredients, seasonings: seasonings)
        }
    }

    // 食材を切る
    private func cutIngredient(_ ingredients: inout [Ingredient]) {
        for i in 0..<ingredients.count {
            ingredients[i].isCut = true
        }
    }

    // 食材を炒める
    private func cookIngredient(_ ingredients: inout [Ingredient]) {
        for i in 0..<ingredients.count {
            ingredients[i].isCooked = true
        }
    }

    // 調味料を加える
    private func addSeasoning(_ seasonings: inout [Seasoning]) {
        for i in 0..<seasonings.count {
            seasonings[i].isAdded = true
        }
    }

    // カロリーを計算する
    private func calcTotalCalorie(ingredients: [Ingredient], seasonings: [Seasoning]) -> Int {
        return ingredients.reduce(0, { $0 + $1.calorie }) + seasonings.reduce(0, { $0 + $1.calorie })
    }

    // 水を加える
    private func boilWater() {
        isWaterBoiled = true
    }
}
