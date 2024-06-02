//
//  WeatherManager.swift
//  Clima
//
//  Created by ปฏิญญา จารุอริยานนท์ on 24/4/2567 BE.
//  Copyright © 2567 BE App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=29702eca850e1b7fe42cbae31741c194"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longtitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    let weatherVC = self.parseJSON(safeData)
                    self.delegate?.didUpdateWeather(self, weather: weatherVC!)
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(WeatherData.self, from: weatherData)
            let name = decoderData.name
            let temp = decoderData.main.temp
            let id = decoderData.weather[0].id
            let weatherModel = WeatherModel(name: name, temp: temp, conditionID: id)
            return weatherModel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
