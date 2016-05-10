//
//  FetchJSON.swift
//  iQuiz
//
//  Created by studentuser on 5/8/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

// task.resume() to get data
// current URL:
import Foundation
import UIKit

//var categories = [Category?]()
let photo1 = UIImage(named: "meal1")

let requestURL: NSURL = NSURL(string: "http://tednewardsandbox.site44.com/questions.json")!
let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
let session = NSURLSession.sharedSession()

let task = session.dataTaskWithRequest(urlRequest) {
    (data, response, error) -> Void in

    let httpResponse = response as! NSHTTPURLResponse
    let statusCode = httpResponse.statusCode

    if (statusCode == 200) {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
            if let titles = json as? [AnyObject] {
                for title in titles {
                    if let category = title["title"] as? String {
                        let name: String = title["title"] as! String
                        let description: String = title["desc"] as! String
                        let questions = title["questions"] as? [AnyObject]
                        var questionObjects = [Question]()
                        for q in questions! {
                            let text = q["text"] as! String
                            let key = q["answer"] as! String
                            var answers = [String]()
                            for index in 0..<q["answers"]!!.count {
                                answers.append((q["answers"]!![index] as? String)!)
                            }
                            var singleQuestionObject: Question? = Question(text: text, key: key, answers: answers)
                            questionObjects.append(singleQuestionObject!)
                        }
                        
                        let category = Category(categoryName: name, descriptionText: description,
                                                categoryImage: photo1!, questions: questionObjects)
                        categories.titles.append(category)
                    }
                }
            }
        } catch {
            print("Error with Json: \(error)")
        }
    }
}