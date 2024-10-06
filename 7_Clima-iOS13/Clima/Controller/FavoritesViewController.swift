//
//  FavoritesViewController.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/02.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
        
    // MARK: - Properties
    
    private var locationGroups = LocationGroup.exampleData
    
    @IBOutlet private weak var tableView: UITableView!
            
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "navTest"
        let backViewButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                             style: .plain,
                                             target: self,
                                             action: #selector(backViewButtonTapped))
        self.navigationItem.leftBarButtonItem = backViewButton
        
        tableView.register(
            UINib(nibName: "FavoritesTableViewCell", bundle: nil),
            forCellReuseIdentifier: "favorites_tableview_cell"
        )
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = FavoritesTableHeaderView(frame: .init(x: 0, y: 0, width: 100, height: 100))
        view.delegate = self
        view.group = locationGroups[section]
        view.configureUI()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
        
    // MARK: - Cells
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = locationGroups[section]
        return group.isExpanded ? group.locations.count : 0
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

extension FavoritesViewController: FavoritesTableHeaderViewDelegate {
    func didTapHeaderView(group: LocationGroup) {
        guard let groupIndex = locationGroups.firstIndex(where: { $0.id == group.id }) else {
            return
        }
        locationGroups[groupIndex].isExpanded.toggle()
        
        let indexPaths = (0..<locationGroups[groupIndex].locations.count).map {
            IndexPath(row: $0, section: groupIndex)
        }
        
        if locationGroups[groupIndex].isExpanded {
            // グループが開かれた場合
            locationGroups[groupIndex].locations.insert(contentsOf: [.init(name: "New")], at: 0)
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [IndexPath(row: 0, section: groupIndex)], with: .right)
            self.tableView.endUpdates()
        } else {
            // グループが閉じられた場合
            locationGroups[groupIndex].locations.removeAll()
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: indexPaths, with: .automatic)
            self.tableView.endUpdates()
        }
    }
}
