//
//  ViewModel.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 17/5/2567 BE.
//

import UIKit

struct AccountModel {
    let accountType: AccountType
    let accountName: String
    let balance: Decimal
    
    var balanceAsAttributedString: NSAttributedString {
        return CurrencyFormatter().makeAttributedCurrency(balance)
    }
}
