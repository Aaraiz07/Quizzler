//
//  Question.swift
//  Quizzler
//
//  Created by Aaraiz Wasim on 30/09/2023.
//

import Foundation

struct Question {
    var text: String
    var answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
