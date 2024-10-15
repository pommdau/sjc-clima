//
//  LocationViewController.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/11.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    // MARK: - Properties
        
    let navigationTitle: String
    let weatherModel: WeatherModel
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var conditionImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    
    // MARK: - LifeCycle
        
    init(navigationTitle: String, weatherModel: WeatherModel) {
        self.navigationTitle = navigationTitle
        self.weatherModel = weatherModel
        super.init(nibName: R.nib.locationViewController.name, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - View
        
    private func configureUI() {
        title = navigationTitle
        temperatureLabel.text = weatherModel.temperatureString
        cityLabel.text = weatherModel.cityName
        conditionImageView.image = UIImage(systemSymbol: weatherModel.conditionSymbol)
        
        if weatherModel.cityName == R.string.localizable.tokyo() {
            self.backgroundImageView.image = R.image.backgroundTokyo()
        } else {
            self.backgroundImageView.image = R.image.background()
        }
    }
}

// MARK: - Previews

#Preview("ベルリン") {
    LocationViewController(navigationTitle: "ベルリン", weatherModel: .berlin)
}

#Preview("東京") {
    LocationViewController(navigationTitle: "東京", weatherModel: .tokyo)
}
