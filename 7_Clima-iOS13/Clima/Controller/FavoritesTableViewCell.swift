//
//  FavoritesTableViewCell.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
        
    // MARK: - Properties
    
    var location: LocationGroup.Location? {
        didSet {
            configureUI()
        }
    }
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
            
    // MARK: - View
    
    func configureUI() {
        guard let location else {
            return
        }
        nameLabel.text = location.name
    }
}
