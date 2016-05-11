//
//  DetailViewController.swift
//  iQuiz
//
//  Created by studentuser on 5/6/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var resultsViewController: ResultViewController!
    
    // Instantiates
    private func resultsVCBuilder() {
        if resultsViewController == nil {
            resultsViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("results")
                as! ResultViewController
        }
    }
    
    // MARK: OUTLETS
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBOutlet weak var Answer4: UIButton!
    
    
    // MARK: Defualt methods
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        loadQuestions()
        resultsVCBuilder()
    }
    
    func loadQuestions() {
        let question = currentCategory?.questions[(currentCategory?.attempted)!]
        self.detailDescriptionLabel.text = question!.text
        Answer1.setTitle(question!.answers[0], forState: UIControlState.Normal)
        Answer2.setTitle(question!.answers[1], forState: UIControlState.Normal)
        Answer3.setTitle(question!.answers[2], forState: UIControlState.Normal)
        Answer4.setTitle(question!.answers[3], forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func answered(sender: UIButton) {
        let qNumber = currentCategory?.attempted
        let qCurrent = currentCategory?.questions[qNumber!]
        correctAnswer = sender.currentTitle! == qCurrent!.answers[Int((qCurrent!.key))! - 1]
        currentCategory?.attempted += 1
        if correctAnswer {
            currentCategory?.score += 1
        }
        // Still have unattempted questions
        if currentCategory?.attempted < currentCategory?.questions.count {
            
            
            
            // Insert into View
            loadQuestions()
            
            NSLog("The answer was: \(correctAnswer)")
            NSLog("Your score is: \(currentCategory?.score) / \(currentCategory?.attempted)")
            NSLog(" ")
        } else {
            // Show results once done with the quiz
            self.navigationController?.pushViewController(resultsViewController, animated: true)
            currentCategory?.attempted = 0
            currentCategory?.score = 0
        }
    }
}

