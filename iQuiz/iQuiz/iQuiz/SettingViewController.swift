//
//  SettingViewController.swift
//  iQuiz
//
//  Created by studentuser on 5/11/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var URL: UITextField!
    
    @IBAction func check(sender: UIButton) {
        let tmpController :UIViewController! = self.presentingViewController;
        
        // Resetting JSON session parameters with the URL entered
        requestURI = self.URL.text!
        requestURL = NSURL(string: requestURI)!
        urlRequest = NSMutableURLRequest(URL: requestURL)
        session = NSURLSession.sharedSession()
        
        self.dismissViewControllerAnimated(false, completion: {()->Void in
            tmpController.dismissViewControllerAnimated(false, completion: nil);
        });
    }
}
