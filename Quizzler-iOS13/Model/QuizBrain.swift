//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Brandon Shearrer on 3/11/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
struct QuizBrain {
    let quiz = [
        Question(question: "A slug's blood is green.", answer: "True"),
        Question(question: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(question: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(question: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(question: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(question: "Google was originally called 'Backrub'.", answer: "True"),
        Question(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(question: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
    ]
    var questionNumber = 0
    var score = 0
    
    //Returns true / false if the answer is correct or not
    mutating func checkAnswer(userAnswer : String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        }
        return false
    }
    
    //returns the text of the current question
    func getQuestionText() -> String {
        return (quiz[questionNumber].question)
    }
    
    //returns the current progress out of 100% for the progress bar
    func getProgress() -> Float {
        return Float(questionNumber+1) / Float(quiz.count)
    }
    
    //returns the score value
    mutating func incrementScore() -> Int {
        return score
    }
    
    //increments the question 
    mutating func nextQuestion() {
        if (questionNumber < quiz.count-1) {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
}
