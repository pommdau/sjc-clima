//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    // MARK: Properties
    var weatherManager = WeatherDataManager()
    let locationManager = CLLocationManager()
    
    @IBOutlet private weak var conditionImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var searchField: UITextField!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        weatherManager.delegate = self
        searchField.delegate = self
    }
}

// MARK: - TextField extension

extension WeatherViewController: UITextFieldDelegate {
    @IBAction private func searchBtnClicked(_ sender: UIButton) {
        searchField.endEditing(true) // dismiss keyboard
        if let text = searchField.text {
            print(text)
        }
        searchWeather()
    }
    
    func searchWeather() {
        if let cityName = searchField.text {
            // 都市を検索するごとに、コンソールに以下のログを出す
            print("action: serach, city: \(cityName)")
            weatherManager.fetchWeather(cityName)
        }
    }
    
    // when keyboard return clicked
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true) // dismiss keyboard
        if let text = searchField.text {
            print(text)
        }
        searchWeather()
        return true
    }
    
    // when textfield deselected
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // by using "textField" (not "searchField") this applied to any textField in this Controller(cuz of delegate = self)
        if let text = textField.text {
            if !text.isEmpty {
                // 有効なテキストが入力されている場合
                return true
            }
        }
        // 入力が空のとき
        textField.placeholder = "Type something here"
        return false // check if city name is valid
    }
    
    // when textfield stop editing (keyboard dismissed)
    func textFieldDidEndEditing(_ textField: UITextField) {
        //        searchField.text = ""   // clear textField
    }
}

// MARK: - View update extension
extension WeatherViewController: WeatherManagerDelegate {
    
    func updateWeather(weatherModel: WeatherModel) {
        DispatchQueue.main.sync {
            temperatureLabel.text = weatherModel.temperatureString
            cityLabel.text = weatherModel.cityName
            self.conditionImageView.image = UIImage(systemName: weatherModel.conditionName)
            
            if weatherModel.cityName == "Tokyo" {
                self.backgroundImageView.image = UIImage(named: "background-tokyo")
            } else {
                self.backgroundImageView.image = UIImage(named: "background")
            }
        }
    }
    
    func failedWithError(error: Error) {
        print(error)
    }
}

// MARK: - CLLocation
extension WeatherViewController: CLLocationManagerDelegate {
    
    @IBAction private func locationButtonClicked(_ sender: UIButton) {
        // Get permission
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(lat, lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
