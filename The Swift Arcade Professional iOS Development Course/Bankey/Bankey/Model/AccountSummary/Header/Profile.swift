//
//  Profile.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 21/5/2567 BE.
//

struct Profile: Codable {
    let id: String
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
