//
//  Profile.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 21/5/2567 BE.
//

import Foundation

struct ProfileModel {
    let welcomeMessage: String
    let name: String
    let date: Date
    
    var dateFormatted: String {
        return date.monthDayYearString
    }
}
