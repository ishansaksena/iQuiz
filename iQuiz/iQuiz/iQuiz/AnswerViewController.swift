//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by ishansaksena on 5/15/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UILabel!
    
    var questionString: String = "question"
    var answerString: String = "answer"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        question.text = questionString
        answer.text = answerString
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func `continue`(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
