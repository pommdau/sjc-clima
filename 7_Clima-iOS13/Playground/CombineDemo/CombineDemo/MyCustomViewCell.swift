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
    
    @IBOutlet private weak var nameLabel: UILabel!
    private var subscription: AnyCancellable?
               
    // MARK: - View
    
    func applyWith(name: String, subject: PassthroughSubject<String, Never>) {
        nameLabel.text = name
        subscription = subject.sink { completion in
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
