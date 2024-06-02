//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by ปฏิญญา จารุอริยานนท์ on 24/4/2567 BE.
//  Copyright © 2567 BE The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var score = 0
    var progressIndex = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> UIColor {
        if userAnswer == self.quiz[progressIndex].answer {
            score += 1
            return UIColor.green
        } else {
            return UIColor.red
        }
    }
    
    func returnProgress() -> Float {
        return Float(progressIndex + 1) / Float(quiz.count)
    }
    
    func returnText() -> String {
        return quiz[progressIndex].text
    }
    
    func returnChoice(_ choice: Int) -> String {
        return quiz[progressIndex].choice[choice]
    }
    
    mutating func checkProgress() {
        if self.progressIndex + 1 < self.quiz.count {
            self.progressIndex += 1
        } else {
            self.score = 0
            self.progressIndex = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
}
