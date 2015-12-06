//
//  Meal.swift
//  MyTipper
//
//  Created by Daniel Zhang on 12/5/15.
//  Copyright © 2015 Daniel Zhang. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    
    var date: String
    var people: String
    var rating: Int
    var totalBill: String
    
    init?(date: String, people: String, rating: Int, totalBill: String) {
        self.date = date
        self.people = people
        self.rating = rating
        self.totalBill = totalBill
       
    }
    
}
