//
//  Repository.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//

import Foundation

protocol IRepository {
    func getOnion() -> Ingredient
    func getPotato() -> Ingredient
    func getCarrot() -> Ingredient
    func getCurryPowder() -> Seasoning
    func getSoySauce() -> Seasoning
    func getSake() -> Seasoning
}
