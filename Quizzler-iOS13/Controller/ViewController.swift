//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var qb = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let selectedAnswer: String = sender.currentTitle!
        
        let isCorrect = qb.checkAnswer(userAnswer: selectedAnswer)
        
        
        if isCorrect {
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.systemRed
        }
        
        qb.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        progressBar.progress = qb.getProgress()
        questionLabel.text = qb.getQuestionText()
        scoreLabel.text = "Score: \(qb.incrementScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

