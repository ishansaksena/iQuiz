//
//  MasterViewController.swift
//  iQuiz
//
//  Created by studentuser on 5/6/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    // MARK: Properties
    var settingsViewController: SettingViewController!// for settings popover for new URL
    var detailViewController: DetailViewController? = nil
    var objects = [Category?]()// To store category data
    
    // MARK: Default UIViewController functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        // Load data only once
        if categories.titles.count == 0 {
            loadJSON()
        } else { // reload for table view
            self.objects = categories.titles
            self.tableView.reloadData()
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showSettings(sender: UIBarButtonItem) {
        NSLog("During settings: \(self.objects.count)")
        settingsVCBuilder()
        self.presentViewController(settingsViewController, animated: true, completion: nil)
        loadJSON()
    }
    
    // MARK: User defined functions
    
    // Instantiates a settings view controller
    private func settingsVCBuilder() {
        if settingsViewController == nil {
            settingsViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("settings")
                as! SettingViewController
        }
    }
    
    // Load JSON and plug it into the table view
    func loadJSON() {
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                do {
                    // Getting the JSON
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    if let titles = json as? [AnyObject] {//JSON data as array
                        for title in titles {
                            // checking if the title exists
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
                                    
                                    let singleQuestionObject: Question? = Question(text: text, key: key, answers: answers)
                                    questionObjects.append(singleQuestionObject!)
                                }
                                
                                let category = Category(categoryName: name, descriptionText: description,
                                                        categoryImage: photo1!, questions: questionObjects)
                                categories.titles.append(category)
                            }
                        }
                    }
                    self.objects = categories.titles
                    self.tableView.reloadData()
                } catch {
                    print("Error with Json: \(error)")
                }
            }
        }
        //Making the request
        task.resume()
    }
    
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as Category?
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object!
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
            currentCategory = objects[(self.tableView.indexPathForSelectedRow?.row)!]
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "CategoryTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CategoryTableViewCell

        let object = objects[indexPath.row]
        cell.categoryName.text = object?.categoryName
        cell.descriptionText.text = object?.descriptionText
        cell.categoryImage.image = object?.categoryImage
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

