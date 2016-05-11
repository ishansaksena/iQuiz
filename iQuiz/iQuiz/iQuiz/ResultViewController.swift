//
//  ResultViewController.swift
//  iQuiz
//
//  Created by studentuser on 5/11/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let attempted = currentCategory?.attempted
        let scored = currentCategory?.score
        resultLabel.text = "You scored \(scored) / \(attempted)!"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        //self.navigationController?.popViewControllerAnimated(true)
        //self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        //self.navigationController?.popViewControllerAnimated(true)
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
