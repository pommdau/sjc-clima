//
//  FavoriteLocationGroupsTableViewCell.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class FavoriteLocationGroupsTableViewCell: UITableViewCell {
        
    // MARK: - Static Properties
        
    // MARK: - Properties
    
    var location: FavoriteLocationGroup.FavoriteLocation? {
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
        nameLabel.text = location.title
    }
}
