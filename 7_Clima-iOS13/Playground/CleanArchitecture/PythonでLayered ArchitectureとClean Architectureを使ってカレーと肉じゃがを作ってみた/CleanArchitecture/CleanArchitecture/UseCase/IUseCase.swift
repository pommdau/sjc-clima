//
//  IUseCase.swift
//  CleanArchitecture
//
//  Created by HIROKI IKEUCHI on 2024/11/06.
//

import Foundation

protocol IUseCase {
    func execute(option: MenuOption) throws(UseCaseError) -> Menu
}
