//
//  WeatherData.swift
//  Clima
//
//  Created by ปฏิญญา จารุอริยานนท์ on 24/4/2567 BE.
//  Copyright © 2567 BE App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Float
}

struct Weather: Codable {
    let id: Int
}
