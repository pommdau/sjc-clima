//
//  FavoritedLocationTableHeaderView.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

// MARK: - FavoritesTableHeaderViewDelegate

protocol FavoritedLocationTableHeaderViewDelegate: AnyObject {
    func tableHeaderViewDidSelect(_ headerView: FavoritedLocationTableHeaderView)
}

// MARK: - FavoritesTableHeaderView

class FavoritedLocationTableHeaderView: UIView {

    // MARK: - Properties
    
    var locationGroup: LocationGroup? {
        didSet {
            configureUI()
        }
    }
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
        guard let view = Bundle.main.loadNibNamed("FavoritedLocationTableHeaderView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        view.frame = bounds
        addSubview(view)
    }
    
    private func configureUI() {
        guard let locationGroup else {
            return
        }
        nameLabel.text = locationGroup.name
        UIView.animate(withDuration: 0.1) {
            let rotationDegrees: CGFloat = locationGroup.isExpanded ? 90 : 0
            self.expandedStatusImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180 * rotationDegrees)
        }
    }
}
