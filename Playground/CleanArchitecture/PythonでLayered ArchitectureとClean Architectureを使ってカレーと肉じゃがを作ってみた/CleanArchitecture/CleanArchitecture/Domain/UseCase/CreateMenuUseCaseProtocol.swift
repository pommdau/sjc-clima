//
//  IUseCase.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//

import Foundation

protocol CreateMenuUseCaseProtocol {
    func cook(option: MenuOption) throws(CreateMenuUseCaseError) -> Menu
}
