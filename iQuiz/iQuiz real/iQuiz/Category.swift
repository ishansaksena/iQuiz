//
//  Category.swift
//  iQuiz
//
//  Created by studentuser on 5/6/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import Foundation
import UIKit

class Category: NSObject, NSCoding {
    // MARK: Properties
    var categoryName: String
    var descriptionText: String
    var categoryImage: UIImage!
    var questions: [Question]
    var attempted: Int
    var score: Int
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("category")
    
    //MARK: Initialization
    
    init? (categoryName: String, descriptionText: String, categoryImage: UIImage, questions: [Question]) {
        if categoryName.isEmpty || descriptionText.isEmpty {
            return nil
        }
        
        self.categoryName = categoryName
        self.descriptionText = descriptionText
        self.categoryImage = categoryImage
        self.questions = questions
        
        self.attempted = 0
        self.score = 0
        
        super.init()
    }
    
    convenience init?(categoryName: String, descriptionText: String, categoryImage: UIImage, questions: [Question],
                     attempted: Int, score: Int) {
        if categoryName.isEmpty || descriptionText.isEmpty {
            return nil
        }
        self.init(categoryName: categoryName, descriptionText: descriptionText, categoryImage: categoryImage, questions: questions)
        
        self.attempted = attempted
        self.score = score
    }
    
    // MARK: Types
    
    struct PropertyKey {
        static let categoryNameKey = "category"
        static let descriptionTextKey = "description"
        static let categoryImageKey = "photo"
        static let questionsKey = "questions"
        static let attemptedKey = "attempted"
        static let scoreKey = "score"
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(categoryName, forKey: PropertyKey.categoryNameKey)
        aCoder.encodeObject(descriptionText, forKey: PropertyKey.descriptionTextKey)
        aCoder.encodeObject(categoryImage, forKey: PropertyKey.categoryImageKey)
        //aCoder.encodeObject(questions, forKey: PropertyKey.questionsKey)
        aCoder.encodeInteger(attempted, forKey: PropertyKey.attemptedKey)
        aCoder.encodeInteger(score, forKey: PropertyKey.scoreKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let categoryName = aDecoder.decodeObjectForKey(PropertyKey.categoryNameKey) as! String
        let descriptionText = aDecoder.decodeObjectForKey(PropertyKey.descriptionTextKey) as! String
        //let questions = aDecoder.decodeObjectForKey(PropertyKey.questionsKey) as! [Question]
        let questions = [Question]()
        
        // Because photo is an optional property of Meal, use conditional cast.
        let categoryImage = aDecoder.decodeObjectForKey(PropertyKey.categoryImageKey) as? UIImage
        
        let  attempted = aDecoder.decodeIntegerForKey(PropertyKey.attemptedKey)
        let  score = aDecoder.decodeIntegerForKey(PropertyKey.scoreKey)
        
        // Must call designated initializer.
        self.init(categoryName: categoryName, descriptionText: descriptionText, categoryImage: categoryImage!,
                  questions: questions, attempted: attempted, score: score)
    }

}

var currentCategory = Category(categoryName: "Not set", descriptionText: "Not set", categoryImage: photo1!, questions: [])
var correctAnswer: Bool = false