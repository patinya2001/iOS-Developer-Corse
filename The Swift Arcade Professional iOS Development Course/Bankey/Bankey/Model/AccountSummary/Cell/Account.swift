//
//  Account.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 21/5/2567 BE.
//

import Foundation

struct Account: Codable {
    let id: String
    let type: AccountType
    let name: String
    let amount: Decimal
    let createdDateTime: Date
}
