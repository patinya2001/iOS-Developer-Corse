//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by ปฏิญญา จารุอริยานนท์ on 24/4/2567 BE.
//  Copyright © 2567 BE The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let choice: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.choice = a
        self.answer = correctAnswer
    }
}
