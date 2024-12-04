//
//  ArticleDetailViewController.swift
//  viper-demo
//
//  Created by HIROKI IKEUCHI on 2024/12/03.
//

import UIKit

extension ArticleDetailViewController {
    enum Row: String {
        case title
        case body
        
        static var rows: [Row] {
            return [.title, .body]
        }
    }
}

class ArticleDetailViewController: UIViewController {

    var articleEntity: ArticleEntity!
    var presenter: ArticleDetailPresenterProtocol!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad(articleEntity: articleEntity)
    }
}

// MARK: - UITableViewDataSource

extension ArticleDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.rawValue, for: indexPath)
        
        if row == .title {
            cell.textLabel?.text = "title"
            cell.detailTextLabel?.text = articleEntity.title
        }
        
        if row == .body {
            cell.textLabel?.text = articleEntity.body
            cell.detailTextLabel?.text = nil
        }
        
        return cell
    }
}

// MARK: - ArticleDetailViewProtocol

extension ArticleDetailViewController: ArticleDetailViewProtocol {

    func showArticle(_ articleEntity: ArticleEntity) {
        self.articleEntity = articleEntity
        tableView.reloadData()
    }
    
    func showError(_ error: any Error) {
        // SKIP
    }
}
