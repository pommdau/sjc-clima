//
//  ArticleListRouterProtocol.swift
//  viper-demo
//
//  Created by HIROKI IKEUCHI on 2024/12/04.
//

import UIKit

protocol ArticleListRouterProtocol: AnyObject {
    
    func showArticleDetail(articleEntity: ArticleEntity)
    
}

class ArticleListRouter: ArticleListRouterProtocol {

    weak var view: UIViewController! // 循環参照を避けるために弱参照とする
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func showArticleDetail(articleEntity: ArticleEntity) {
        // TODO
        print("詳細画面へ遷移: id=\(articleEntity.id)")
    }

}
