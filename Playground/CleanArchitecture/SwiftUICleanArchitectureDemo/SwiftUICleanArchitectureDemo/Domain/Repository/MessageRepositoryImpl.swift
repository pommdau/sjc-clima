//
//  MessageRepositoryImpl.swift
//  SwiftUICleanArchitectureDemo
//
//  Created by HIROKI IKEUCHI on 2024/11/05.
//

import Foundation

struct MessageRepositoryImpl: MessageRepository {
    
    var dataSource: MessageDataSource
    
    func getMessages() -> [Message] {
        return dataSource.getMessages()
    }
}
