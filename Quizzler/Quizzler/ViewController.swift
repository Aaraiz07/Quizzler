//
//  ViewController.swift
//  Quizzler
//
//  Created by Aaraiz Wasim on 23/09/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    let quiz = [
        ["Four + Two is equal to Six", "True"],
        ["Six - Three is equal to Four", "False"],
        ["Seven + Three is equal to Ten", "True"]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func asnwerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else if questionNumber + 1 == quiz.count {
            questionNumber = 0
        }
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = quiz[questionNumber][0]
    }
    
}

