//
//  ArticleListViewController.swift
//  viper-demo
//
//  Created by HIROKI IKEUCHI on 2024/12/03.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var articleEntities: [ArticleEntity] = [
        ArticleEntity(id: 1, userId: 2, title: "demo-title", body: "demo-body")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

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

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
