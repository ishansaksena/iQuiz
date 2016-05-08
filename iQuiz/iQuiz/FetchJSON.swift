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

let requestURL: NSURL = NSURL(string: "http://www.learnswiftonline.com/Samples/subway.json")!
let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
let session = NSURLSession.sharedSession()
let task = session.dataTaskWithRequest(urlRequest) {
    (data, response, error) -> Void in
    
    let httpResponse = response as! NSHTTPURLResponse
    let statusCode = httpResponse.statusCode
    
    if (statusCode == 200) {
        
        do{
            
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
            
            if let stations = json["stations"] as? [[String: AnyObject]] {
                
                for station in stations {
                    
                    if let name = station["stationName"] as? String {
                        
                        if let year = station["buildYear"] as? String {
                            NSLog("%@ (Built %@)",name,year)
                        }
                        
                    }
                }
                
            }
            
        }catch {
            print("Error with Json: \(error)")
            
        }
    }
}


