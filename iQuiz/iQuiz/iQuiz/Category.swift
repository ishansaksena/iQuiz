//
//  Category.swift
//  iQuiz
//
//  Created by studentuser on 5/6/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import Foundation
import UIKit

class Category {
    // MARK: Properties
    var categoryName: String
    var descriptionText: String
    var categoryImage: UIImage!
    var questions: [Question]
    var attempted: Int = 0
    var score: Int = 0
    
    init? (categoryName: String, descriptionText: String, categoryImage: UIImage, questions: [Question]) {
        if categoryName.isEmpty || descriptionText.isEmpty {
            return nil
        }
        
        self.categoryName = categoryName
        self.descriptionText = descriptionText
        self.categoryImage = categoryImage
        self.questions = questions
    }
}

var currentCategory = Category(categoryName: "Not set", descriptionText: "Not set", categoryImage: photo1!, questions: [])
var correctAnswer: Bool = false