//
//  Question.swift
//  iQuiz
//
//  Created by studentuser on 5/9/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import Foundation

class Question {
    var text: String
    var key: String
    var answers: [String]
    
    init(text: String, key: String, answers: [String]) {
        self.text = text
        self.key = key
        self.answers = answers
    }
}