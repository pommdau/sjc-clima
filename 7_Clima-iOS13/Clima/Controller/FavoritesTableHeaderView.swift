//
//  FavoritesTableHeaderView.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class FavoritesTableHeaderView: UIView {

    // MARK: - Properties
        
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var expandedStatusImageView: UIImageView!

    // MARK: - LifeCycle
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View
    
    // MARK: - Helpers
    
    private func loadNib() {
        guard let view = Bundle.main.loadNibNamed("FavoritesTableHeaderView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
    }
}
