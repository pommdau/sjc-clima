//
//  FavoritesTableHeaderView.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/04.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

protocol FavoritesTableHeaderViewDelegate: AnyObject {
    func didTapHeaderView(group: FavoritedLocationGroup)
}

class FavoritesTableHeaderView: UIView {

    // MARK: - Properties
    
    var group: FavoritedLocationGroup?
//    var tapAction: (() -> Void)?
    weak var delegate: FavoritesTableHeaderViewDelegate?
        
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
    
    // MARK: - Helpers
    
    private func loadNib() {
        guard let view = Bundle.main.loadNibNamed("FavoritesTableHeaderView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    // MARK: - View
    
    func configureUI() {
        guard let group else {
            return
        }
        nameLabel.text = group.name
//        expandedStatusImageView.image = group.isExpanded ? UIImage(systemName: "chevron.down") : UIImage(systemName: "chevron.forward")
        UIView.animate(withDuration: 2.0) {
            let rotationDegrees: CGFloat = group.isExpanded ? 90 : 0
            self.expandedStatusImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180 * rotationDegrees)
        }
    }
            
    // MARK: - @IBAction
    
    @IBAction private func handleViewTapped(_ sender: UITapGestureRecognizer) {
        guard let group else {
            return
        }
//        tapAction?()
        delegate?.didTapHeaderView(group: group)
    }
}
