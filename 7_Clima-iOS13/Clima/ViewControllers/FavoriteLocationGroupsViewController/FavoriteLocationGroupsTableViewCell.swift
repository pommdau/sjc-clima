//
//  FavoriteLocationGroupsTableViewCell.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class FavoriteLocationGroupsTableViewCell: UITableViewCell {
                
    // MARK: - Properties
    
    @IBOutlet private weak var nameLabel: UILabel!
                
    // MARK: - View
    
    func applyWith(location: FavoriteLocation) {
        nameLabel.text = location.title
    }
}
