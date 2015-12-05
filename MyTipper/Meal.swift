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
    var people: Int
    var rating: Int
    var totalBill: Double
    
    init?(date: String, people: Int, rating: Int, totalBill: Double) {
        self.date = date
        self.people = people
        self.rating = rating
        self.totalBill = totalBill
        
        if totalBill == 0.0 || rating < 0 {
            return nil
        }
    }
}
