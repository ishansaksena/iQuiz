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
    var titles = [Category?]()
    var questions = [Question?]()
    
    init(titles: [Category?]) {
        self.titles = titles
    }
    
    convenience init() {
        self.init(titles: [])
    }
}

var categories = Categories()