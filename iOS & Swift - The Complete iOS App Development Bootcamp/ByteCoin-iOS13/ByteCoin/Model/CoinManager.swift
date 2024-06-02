//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCurrency(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "568D4A38-8DF6-4ABC-A8EA-35D350524B27"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    let vc = self.parseJSON(safeData)
                    self.delegate?.didUpdateCurrency(self, coin: vc ?? CoinModel(currency: "None", rate: 0))
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(CoinData.self, from: coinData)
            let currency = decoderData.asset_id_quote
            let rate = decoderData.rate
            return CoinModel(currency: currency, rate: rate)
        } catch {
            print(error)
            return nil
        }
    }
}
