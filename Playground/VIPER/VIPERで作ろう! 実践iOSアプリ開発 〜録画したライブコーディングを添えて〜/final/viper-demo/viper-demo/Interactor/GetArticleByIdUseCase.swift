//
//  GetArticleByIdUseCase.swift
//  viper-demo
//
//  Created by HIROKI IKEUCHI on 2024/12/04.
//

import Foundation

class GetArticleByIdUseCase: UseCaseProtocol {
    func execute(_ parameter: Int, completion: ((Result<ArticleEntity, Error>) -> ())?) {
        let res = ArticleEntity(id: 1, userId: 1, title: "タイトル1", body: "本文1")
        completion?(.success(res))
    }
}
