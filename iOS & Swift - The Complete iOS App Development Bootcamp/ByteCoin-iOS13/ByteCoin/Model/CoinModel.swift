//
//  CoinModel.swift
//  ByteCoin
//
//  Created by ปฏิญญา จารุอริยานนท์ on 26/4/2567 BE.
//  Copyright © 2567 BE The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let currency: String
    let rate: Double
    
    var rateString: String {
        return String(format: "%.2f", rate)
    }
}
