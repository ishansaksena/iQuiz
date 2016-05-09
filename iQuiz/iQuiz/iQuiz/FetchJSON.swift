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

let categories = [Category?]()

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
                        NSLog("\(title["title"])")
                    }
                }
            }
        } catch {
            print("Error with Json: \(error)")
        }
    }
}


