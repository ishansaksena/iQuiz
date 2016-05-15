//
//  Categories.swift
//  iQuiz
//
//  Created by studentuser on 5/9/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import Foundation
import UIKit

class Categories {
    // MARK: Properties
    var titles = [Category?]()
    
    // MARK: Initializers
    init(titles: [Category?]) {
        self.titles = titles
    }
    
    convenience init() {
        self.init(titles: [])
    }
    
    // MARK: NSCoding
    
    // SAVING
    func saveTitles() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(titles[0] as! AnyObject, toFile: Category.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save title: \(titles[0]!.categoryName)")
        } else {
            print("Successfully saved data")
        }
    }
    
    // LOADING
    func loadCategories() {
        self.titles = (NSKeyedUnarchiver.unarchiveObjectWithFile(Category.ArchiveURL.path!) as? [Category])!
    }
}

var categories = Categories()