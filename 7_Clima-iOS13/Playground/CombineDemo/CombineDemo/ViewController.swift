//
//  ViewController.swift
//  CombineDemo
//
//  Created by HIROKI IKEUCHI on 2024/10/22.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private var items: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    private let subject = PassthroughSubject<String, Never>()
    @IBOutlet weak var tableView: UITableView!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(.init(nibName: "MyCustomViewCell", bundle: .main), forCellReuseIdentifier: "MyCustomViewCell")
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        subject.send(items[indexPath.row])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomViewCell") as? MyCustomViewCell else {
            return UITableViewCell()
        }
        cell.applyWith(name: items[indexPath.row], subject: subject)
        return cell
    }
}
