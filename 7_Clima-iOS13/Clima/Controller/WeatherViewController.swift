//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import HTTPTypes

class WeatherViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: Properties
    
    let locationManager = CLLocationManager()
    
    // MARK: @IBOutlet
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var conditionImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var searchField: UITextField!
    @IBOutlet private weak var dadJokeLabel: UITextView!
        
    // MARK: - LifeCycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        searchField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
#if DEBUG
//        Task {
//            searchField.text = "Tokyo"
//            await handleFetchWeatherWithSearchedWord()
//            searchField.text = ""
//        }
#endif
    }
}

// MARK: - @IBAction

extension WeatherViewController {
    @IBAction private func searchBtnClicked(_ sender: UIButton) {
        searchField.endEditing(true) // dismiss keyboard
        Task {
            await handleFetchWeatherWithSearchedWord()
        }
    }
    
    @IBAction private func locationButtonClicked(_ sender: UIButton) {
        locationManager.requestWhenInUseAuthorization() // Get permission
        locationManager.requestLocation()
    }
    
    @IBAction private func favoritesButtonClicked(_ sender: UIButton) {
        let viewController = FavoritedLocationViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction private func dadJokeButtonClicked(_ sender: UIButton) {
        Task {
            do {
                let jokeData = try await APIService.shared.fetchRandomJoke()
                dadJokeLabel.text = jokeData.joke
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {

    // when keyboard return clicked
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true) // dismiss keyboard
        Task {
            await handleFetchWeatherWithSearchedWord()
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
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
    func textFieldDidEndEditing(_ textField: UITextField) {}
}

// MARK: - Handle Searching

extension WeatherViewController {
    func handleFetchWeatherWithSearchedWord() async {
        guard let searchedWord = searchField.text else {
            return
        }
                
        do {
            let weatherData = try await APIService.shared.fetchWeather(for: .city(searchedWord))
            let weatherModel = WeatherModel(from: weatherData)
            configureUI(weatherModel: weatherModel)
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - View update extension

extension WeatherViewController {
    // TODO: Viewにモデルをもたせる形に変更する // swiftlint:disable:this todo
    private func configureUI(weatherModel: WeatherModel) {
        temperatureLabel.text = weatherModel.temperatureString
        cityLabel.text = weatherModel.cityName
        conditionImageView.image = UIImage(systemName: weatherModel.conditionName)
        
        if weatherModel.cityName == "Tokyo" {
            self.backgroundImageView.image = UIImage(named: "background-tokyo")
        } else {
            self.backgroundImageView.image = UIImage(named: "background")
        }
    }
}

// MARK: - CLLocation
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        Task {
            do {
                let weatherData = try await APIService.shared.fetchWeather(for: .coordinate(.init(latitude: lat, longitude: lon)))
                let weatherModel = WeatherModel(from: weatherData)
                configureUI(weatherModel: weatherModel)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
