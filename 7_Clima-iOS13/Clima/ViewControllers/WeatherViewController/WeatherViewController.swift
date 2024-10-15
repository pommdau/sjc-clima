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
    
    // MARK: - Properties
    
    private var weather: WeatherModel? {
        didSet {
            configureWeatherUI()
        }
    }
    
    private var joke: IcanhazdadjokeData? {
        didSet {
            configureJokeUI()
        }
    }
    
    // MARK: Properties
    
    private let locationManager = CLLocationManager()
    
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
        searchField.placeholder = R.string.localizable.weatherViewControllertextFieldSearchFieldPlaceholder()
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
        let viewController = FavoriteLocationGroupsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction private func dadJokeButtonClicked(_ sender: UIButton) {
        Task {
            do {
                joke = try await APIService.shared.fetchRandomJoke()
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
        return false // check if city name is valid
    }
    
    // when textfield stop editing (keyboard dismissed)
    func textFieldDidEndEditing(_ textField: UITextField) {}
}

// MARK: - Handle Searching

extension WeatherViewController {
    private func handleFetchWeatherWithSearchedWord() async {
        guard let searchedWord = searchField.text else {
            return
        }
        do {
            let weatherData = try await APIService.shared.fetchWeather(for: .city(searchedWord))
            self.weather = WeatherModel(from: weatherData)
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - View update extension

extension WeatherViewController {
    private func configureJokeUI() {
        guard let joke else {
            return
        }
        dadJokeLabel.text = joke.joke
    }
    
    private func configureWeatherUI() {
        guard let weather else {
            return
        }
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

// MARK: - CLLocation
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        Task {
            do {
                let weatherData = try await APIService.shared.fetchWeather(for:
                        .coordinate(.init(
                            latitude: location.coordinate.latitude,
                            longitude: location.coordinate.longitude)
                        )
                )
                self.weather = WeatherModel(from: weatherData)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
