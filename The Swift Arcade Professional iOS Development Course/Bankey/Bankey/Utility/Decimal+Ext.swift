//
//  Decimal+Ext.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 17/5/2567 BE.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
