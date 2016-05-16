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
    
    func saveCategories() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(self.titles[0]!, toFile: Category.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save categories")
        } else {
            print("Successfully saved data")
        }
    }
    
}

var categories = Categories()

// MARK: NSCoding

// SAVING

// LOADING
func loadCategories() {
    categories = (NSKeyedUnarchiver.unarchiveObjectWithFile(Category.ArchiveURL.path!) as? Categories)!
}


