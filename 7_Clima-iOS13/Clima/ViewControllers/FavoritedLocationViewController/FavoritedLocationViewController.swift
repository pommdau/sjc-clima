//
//  FavoritedLocationViewController.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/02.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class FavoritedLocationViewController: UIViewController {
        
    // MARK: - Properties
    
    private var locationGroups = LocationGroup.definedData
    @IBOutlet private weak var tableView: UITableView!
            
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        print(FavoritedLocationTableViewCell.nibName)
        super.viewDidLoad()
        setupNavigationView()
        tableView.register(
            UINib(nibName: FavoritedLocationTableViewCell.nibName, bundle: nil),
            forCellReuseIdentifier: FavoritedLocationTableViewCell.reuseIdentifier
        )        
    }
        
    // MARK: - Setup NavigationView
    
    private func setupNavigationView() {
        self.title = "お気に入り"
        let backViewButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                             style: .plain,
                                             target: self,
                                             action: #selector(backViewButtonTapped))
        self.navigationItem.leftBarButtonItem = backViewButton
    }
    
    @objc
    private func backViewButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDelegate

extension FavoritedLocationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = locationGroups[indexPath.section].locations[indexPath.row]
                
        Task {
            let weatherData: WeatherData
            do {
                weatherData = try await APIService.shared.fetchWeather(for: .city(location.city))
            } catch {
                print(error.localizedDescription)
                return
            }
            let weatherModel = WeatherModel(from: weatherData)
            let locationViewController = LocationViewController(
                navigationTitle: location.title, weatherModel: weatherModel
            )
            navigationController?.pushViewController(locationViewController, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource

extension FavoritedLocationViewController: UITableViewDataSource {
    
    // MARK: - Sections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        locationGroups.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = FavoritedLocationTableHeaderView(frame: .init(x: 0, y: 0, width: 100, height: 100))
        view.delegate = self
        view.locationGroup = locationGroups[section]
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
        
    // MARK: - Cells
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = locationGroups[section]
        return group.isExpanded ? group.locations.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FavoritedLocationTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? FavoritedLocationTableViewCell else {
            return UITableViewCell()
        }
        cell.location = locationGroups[indexPath.section].locations[indexPath.row]
        return cell
    }
}

// MARK: - FavoritesTableHeaderViewDelegate

extension FavoritedLocationViewController: FavoritedLocationTableHeaderViewDelegate {
    func tableHeaderViewDidSelect(_ headerView: FavoritedLocationTableHeaderView) {
        guard
            let group = headerView.locationGroup,
            let groupIndex = locationGroups.firstIndex(where: { $0.id == group.id }) else {
            return
        }
        
        // 開閉状態のデータ更新
        locationGroups[groupIndex].isExpanded.toggle()
                
        // 開閉処理をアニメーション付きで行う
        if locationGroups[groupIndex].isExpanded {
            // グループが開かれた場合
            let indexPaths = (0..<LocationGroup.definedData[groupIndex].locations.count).map {
                IndexPath(row: $0, section: groupIndex)
            }
            locationGroups[groupIndex].locations.insert(
                contentsOf: LocationGroup.definedData[groupIndex].locations, at: 0
            )
            self.tableView.beginUpdates()
            // TODO: 本当は.bottomとしたい // swiftlint:disable:this todo
            self.tableView.insertRows(at: indexPaths, with: .fade)
            self.tableView.endUpdates()
        } else {
            // グループが閉じられた場合
            let indexPaths = (0..<locationGroups[groupIndex].locations.count).map {
                IndexPath(row: $0, section: groupIndex)
            }
            locationGroups[groupIndex].locations.removeAll()
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: indexPaths, with: .fade)
            self.tableView.endUpdates()
        }
        
        // ヘッダビュー側のデータとUIの更新
        headerView.locationGroup = locationGroups[groupIndex]
    }
}

#Preview {
    FavoritedLocationViewController()
}
