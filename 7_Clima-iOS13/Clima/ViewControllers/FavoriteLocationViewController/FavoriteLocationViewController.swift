//
//  LocationViewController.swift
//  Clima
//
//  Created by HIROKI IKEUCHI on 2024/10/11.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class FavoriteLocationViewController: UIViewController {
    
    // MARK: - Properties
        
    let navigationTitle: String
    let weather: WeatherModel
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var conditionImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    
    // MARK: - LifeCycle
        
    init(navigationTitle: String, weather: WeatherModel) {
        self.navigationTitle = navigationTitle
        self.weather = weather
        super.init(nibName: R.nib.favoriteLocationViewController.name, bundle: nil)
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
        temperatureLabel.text = weather.temperatureString
        cityLabel.text = weather.cityName
        conditionImageView.image = UIImage(systemSymbol: weather.conditionSymbol)
        
        if weather.cityName == R.string.localizable.tokyo() {
            self.backgroundImageView.image = R.image.backgroundTokyo()
        } else {
            self.backgroundImageView.image = R.image.background()
        }
    }
}

// MARK: - Previews

#Preview("ベルリン") {
    FavoriteLocationViewController(navigationTitle: "ベルリン", weather: .berlin)
}

#Preview("東京") {
    FavoriteLocationViewController(navigationTitle: "東京", weather: .tokyo)
}
