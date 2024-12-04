//
//  ArticleDetailPresenter.swift
//  viper-demo
//
//  Created by HIROKI IKEUCHI on 2024/12/04.
//

import Foundation

// MARK: - ArticleDetailPresenterProtocol(定義)

protocol ArticleDetailPresenterProtocol: AnyObject {
    func didLoad(articleEntity: ArticleEntity)
}

// MARK: - ArticleDetailViewProtocol

protocol ArticleDetailViewProtocol: AnyObject {
    func showArticle(_ articleEntity: ArticleEntity)
    func showError(_ error: Error)
}

// MARK: - ArticleDetailPresenter

class ArticleDetailPresenter {
    struct Dependency {
        let getArticleByIdUseCase: UseCase<Int, ArticleEntity, Error>
    }
    
    weak var view: ArticleDetailViewProtocol!
    private var di: Dependency
    
    init(view: ArticleDetailViewProtocol!, inject dependency: Dependency) {
        self.view = view
        self.di = dependency
    }
    
}

// MARK: - ArticleDetailPresenterProtocol(実装)

extension ArticleDetailPresenter: ArticleDetailPresenterProtocol {
    func didLoad(articleEntity: ArticleEntity) {
        di.getArticleByIdUseCase.execute(articleEntity.id) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let articleEntitiy):
                self.view.showArticle(articleEntitiy)
            case .failure(let error):
                self.view.showError(error)
            }
        }
    }
}
