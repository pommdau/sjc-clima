//
//  ArticleListPresenterProtocol.swift
//  viper-demo
//
//  Created by HIROKI IKEUCHI on 2024/12/04.
//

import Foundation

protocol ArticleListPresenterProtocol: AnyObject {
    func didLoad()
    func didSelect(articleEntity: ArticleEntity)
}

protocol ArticleListViewProtocol: AnyObject {
    func showArticles(_ articleEntities: [ArticleEntity])
    func showEmpty()
    func showError(_ error: Error)
}

class ArticleListPresenter {
    
    struct Dependency {
        let router: ArticleListRouter!
        let getArticlesArrayUseCase: UseCase<Void, [ArticleEntity], Error>!
    }
    
    weak var view: ArticleListViewProtocol!
    private var di: Dependency
    
    init(view: ArticleListViewProtocol? = nil, inject dependency: Dependency) {
        self.view = view
        self.di = dependency
    }
}

extension ArticleListPresenter: ArticleListPresenterProtocol {
    func didLoad() {
        di.getArticlesArrayUseCase.execute(()) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let articleEntities):
                if articleEntities.isEmpty {
                    self.view.showEmpty()
                    return
                }
                self.view.showArticles(articleEntities)
            case .failure(let error):
                self.view.showError(error)
            }
        }
    }
    
    func didSelect(articleEntity: ArticleEntity) {
        di.router.showArticleDetail(articleEntity: articleEntity)
    }        
}
