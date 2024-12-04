//
//  ArticleListViewController.swift
//  viper-demo
//
//  Created by HIROKI IKEUCHI on 2024/12/03.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    var presenter: ArticleListPresenterProtocol!
    @IBOutlet weak var tableView: UITableView!
    private var articleEntities: [ArticleEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
    }
}

// MARK: - UITableViewDataSource

extension ArticleListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleEntities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articleEntities[indexPath.row].title
        return cell
    }        
}

// MARK: - UITableViewDelegate

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelect(articleEntity: articleEntities[indexPath.row])
    }
}

// MARK: - ArticleListViewProtocol

extension ArticleListViewController: ArticleListViewProtocol {
    func showArticles(_ articleEntities: [ArticleEntity]) {
        self.articleEntities = articleEntities
        tableView.reloadData()
    }
    
    func showEmpty() {
        showArticles([])
    }
    
    func showError(_ error: any Error) {
        // Skip
    }        
}
