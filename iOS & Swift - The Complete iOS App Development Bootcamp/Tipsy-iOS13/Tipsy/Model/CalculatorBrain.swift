//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by ปฏิญญา จารุอริยานนท์ on 24/4/2567 BE.
//  Copyright © 2567 BE The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var pct: String?
    var totalBill: Float?
    
    mutating func calculateTotalBill(bill: String, splitNumber: String, pct: String) {
        self.pct = pct
        let pctFloat = (Float(pct.replacingOccurrences(of: "%", with: "")) ?? 0) / 100.0
        totalBill = ((Float(bill) ?? 0) + ((Float(bill) ?? 0) * pctFloat)) / (Float(splitNumber) ?? 0)
    }
    
    func getTotalBill() -> String {
        return String(format: "%.2f", totalBill ?? 0)
    }
    
    func getPct() -> String {
        return pct ?? "0"
    }
}
