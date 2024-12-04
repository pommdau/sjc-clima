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
        guard let articleDetailViewController = UIStoryboard(name: "ArticleDetail", bundle: nil).instantiateInitialViewController()
                as? ArticleDetailViewController else {
            fatalError()
        }
        articleDetailViewController.articleEntity = articleEntity
        articleDetailViewController.presenter = ArticleDetailPresenter(
            view: articleDetailViewController,
            inject: ArticleDetailPresenter.Dependency(
                getArticleByIdUseCase: UseCase(GetArticleByIdUseCase())
            )
        )
        
        view.navigationController?.pushViewController(articleDetailViewController, animated: true)
    }

}
