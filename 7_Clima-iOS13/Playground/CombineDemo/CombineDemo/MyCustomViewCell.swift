//
//  MyCustomViewCell.swift
//  CombineDemo
//
//  Created by HIROKI IKEUCHI on 2024/10/22.
//

import UIKit
import Combine

class MyCustomViewCell: UITableViewCell {

    // MARK: - Properties
        
    private var subscription: AnyCancellable?
    @IBOutlet private weak var nameLabel: UILabel!
               
    // MARK: - View
    
    func applyWith(name: String, subject: PassthroughSubject<String, Never>) {
        nameLabel.text = name
        subscription = subject.sink { _ in
        } receiveValue: { value in
            guard let nameLabelText = self.nameLabel.text else {
                return
            }
            if nameLabelText == value {
                print("セルがタップされました: \(nameLabelText)")
            }
        }
    }
}
