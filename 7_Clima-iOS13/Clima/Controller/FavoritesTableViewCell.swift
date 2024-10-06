//
//  FavoritesTableViewCell.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
        
    // MARK: - Static Properties
    
    // MARK: NibName and ReuseIdentifier
    
    static var nibName: String {
        String(describing: self) // "FavoritesTableViewCell"を返す
    }
    static let reuseIdentifier = "favorites-tableview-cell"
    
    // MARK: - Properties
    
    var location: LocationGroup.Location? {
        didSet {
            configureUI()
        }
    }
    
    @IBOutlet private weak var nameLabel: UILabel!
                
    // MARK: - View
    
    private func configureUI() {
        guard let location else {
            return
        }
        nameLabel.text = location.name
    }
}
