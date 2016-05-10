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


