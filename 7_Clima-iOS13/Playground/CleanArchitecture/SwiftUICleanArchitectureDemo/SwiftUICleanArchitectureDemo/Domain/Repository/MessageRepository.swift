//
//  MessageRepository.swift
//  SwiftUICleanArchitectureDemo
//
//  Created by HIROKI IKEUCHI on 2024/11/05.
//

import Foundation

protocol MessageRepository {
    
    func getMessages() -> [Message]
}