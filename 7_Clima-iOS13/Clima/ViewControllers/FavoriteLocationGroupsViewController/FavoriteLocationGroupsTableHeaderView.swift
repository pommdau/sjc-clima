//
//  FavoriteLocationGroupsTableHeaderView.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

// MARK: - FavoritesTableHeaderViewDelegate

protocol FavoritedLocationTableHeaderViewDelegate: AnyObject {
    func tableHeaderViewDidSelect(_ headerView: FavoriteLocationGroupsTableHeaderView)
}

// MARK: - FavoritesTableHeaderView

class FavoriteLocationGroupsTableHeaderView: UIView {

    // MARK: - Properties
    
    var locationGroup: FavoriteLocationGroup?
    weak var delegate: FavoritedLocationTableHeaderViewDelegate?
        
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
    
    // MARK: - @IBAction
    
    @IBAction private func viewTapped(_ sender: UITapGestureRecognizer) {
        delegate?.tableHeaderViewDidSelect(self)
    }
        
    // MARK: - View
    
    private func loadNib() {
        guard let view = R.nib.favoriteLocationGroupsTableHeaderView.firstView(withOwner: self) else {
            return
        }
        view.frame = bounds
        addSubview(view)
    }
    
    func applyWith(group: FavoriteLocationGroup, isExpanded: Bool) {
        self.locationGroup = group
        self.nameLabel.text = group.name
        UIView.animate(withDuration: 0.1) {
            let rotationDegrees: CGFloat = isExpanded ? 90 : 0
            self.expandedStatusImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180 * rotationDegrees)
        }
    }
}
