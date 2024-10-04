//
//  FavoritesViewController.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/02.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

struct FavoritedLocationGroup: Identifiable {
    struct FavoritedLocation: Identifiable {
        let uuid = UUID()
        var id: String { uuid.uuidString }
        var name: String
    }
    let uuid = UUID()
    let name: String
    var id: String { uuid.uuidString }
    let locations: [FavoritedLocation]
}

extension FavoritedLocationGroup {
    static let exampleData: [FavoritedLocationGroup] = [
        .init(name: "EU", locations: [
            .init(name: "ベルリン"),
            .init(name: "アムステルダム"),
            .init(name: "ロンドン"),
        ]),
        .init(name: "アジア", locations: [
            .init(name: "東京"),
            .init(name: "バンコク"),
        ]),
        .init(name: "オセアニア", locations: [
            .init(name: "シドニー"),
            .init(name: "メルボルン"),
            .init(name: "ロンドン"),
        ]),
        .init(name: "アフリカ", locations: [
            .init(name: "ケープタウン"),
        ])
    ]
}

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var locationsTableView: UITableView!
    
    // MARK: - Properties
    
    private var locationGroups = FavoritedLocationGroup.exampleData
            
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "navTest"
        let backViewButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                             style: .plain,
                                             target: self,
                                             action: #selector(backViewButtonTapped))
        self.navigationItem.leftBarButtonItem = backViewButton
    }
        
    // MARK: - NavigationItem Actions
    
    @objc
    func backViewButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: -

extension FavoritesViewController: UITableViewDelegate {
    
}

extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = UITableViewCell()
        cell.textLabel?.text = locationGroups[section].name
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        locationGroups.count
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locationGroups[section].locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = locationGroups[indexPath.section].locations[indexPath.row].name
        return cell
    }
}
