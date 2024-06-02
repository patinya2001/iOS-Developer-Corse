//
//  WeatherModel.swift
//  Clima
//
//  Created by ปฏิญญา จารุอริยานนท์ on 24/4/2567 BE.
//  Copyright © 2567 BE App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let name: String
    let temp: Float
    let conditionID: Int
    
    var tempString: String {
        return String(format: "%.1f", temp)
    }
    
    var conditionString: String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
