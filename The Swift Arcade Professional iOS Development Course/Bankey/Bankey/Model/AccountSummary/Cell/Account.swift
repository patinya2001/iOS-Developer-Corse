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
    
    static func makeSkeleton() -> Account {
        return Account(id: "1", type: .Banking, name: "Account name", amount: 0.0, createdDateTime: Date())
    }
}
