//
//  TODOItem.swift
//  TODOList
//
//  Created by HIROKI IKEUCHI on 2024/11/11.
//

import Foundation

struct TODOItem: Hashable {
    private let uuid: String
    let name: String
    var isDone: Bool
    
    init(uuid: String = UUID().uuidString, name: String, isDone: Bool = false) {
        self.uuid = uuid
        self.name = name
        self.isDone = isDone
    }
}

extension TODOItem: Identifiable {
    var id: String {
        uuid
    }
}

extension TODOItem {
    static var sampleData: [TODOItem] = [
        .init(name: "Item1", isDone: false),
        .init(name: "Item2", isDone: true),
        .init(name: "Item3", isDone: false),
    ]
}
