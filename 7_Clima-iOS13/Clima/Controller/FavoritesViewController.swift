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
        
    // MARK: - Properties
    
    private var locationGroups = FavoritedLocationGroup.exampleData
    
    @IBOutlet private weak var locationsTableView: UITableView!
            
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "navTest"
        let backViewButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                             style: .plain,
                                             target: self,
                                             action: #selector(backViewButtonTapped))
        self.navigationItem.leftBarButtonItem = backViewButton
        
        locationsTableView.register(
            UINib(nibName: "FavoritesTableViewCell", bundle: nil),
            forCellReuseIdentifier: "favorites_tableview_cell"
        )
        locationsTableView.sectionIndexBackgroundColor = .blue
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationsTableView.reloadData()
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
    
    // MARK: - Sections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        locationGroups.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        locationGroups[section].name
    }
        
    // MARK: - Cells
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locationGroups[section].locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favorites_tableview_cell", for: indexPath) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }
        cell.location = locationGroups[indexPath.section].locations[indexPath.row]
        return cell
    }
    
    // MARK: - Selected
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = locationGroups[indexPath.section].locations[indexPath.row]
        print(location.name)
    }
}
