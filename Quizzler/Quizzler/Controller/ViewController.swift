//
//  ViewController.swift
//  Quizzler
//
//  Created by Aaraiz Wasim on 23/09/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let buttonImage = UIImage(named: "Rectangle")
        let templateImage = buttonImage?.withRenderingMode(.alwaysTemplate)
        trueButton.setBackgroundImage(templateImage, for: .normal)
        falseButton.setBackgroundImage(templateImage, for: .normal)

        updateUI()
    }

    @IBAction func asnwerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.tintColor = UIColor.green
            sender.setTitleColor(UIColor.green, for: .normal)
        } else {
            sender.tintColor = UIColor.red
            sender.setTitleColor(UIColor.red, for: .normal)

        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.setTitleColor(UIColor.white, for: .normal)
        falseButton.setTitleColor(UIColor.white, for: .normal)
        trueButton.tintColor = UIColor.white
        falseButton.tintColor = UIColor.white
        
    }
    
}

