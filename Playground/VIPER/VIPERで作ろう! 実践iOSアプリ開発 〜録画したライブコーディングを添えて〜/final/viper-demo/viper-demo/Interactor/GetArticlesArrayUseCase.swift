//
//  GetArticlesArrayUseCase.swift
//  viper-demo
//
//  Created by HIROKI IKEUCHI on 2024/12/04.
//

import Foundation

class GetArticlesArrayUseCase: UseCaseProtocol {
    func execute(_ parameter: Void, completion: ((Result<[ArticleEntity], Error>) -> ())?) {
        let res: [ArticleEntity] = [
            .init(id: 1, userId: 1, title: "タイトル1", body: "本文1"),
            .init(id: 2, userId: 2, title: "タイトル2", body: "本文2"),
            .init(id: 3, userId: 3, title: "タイトル3", body: "本文3"),
        ]
        completion?(.success(res))
    }
}
