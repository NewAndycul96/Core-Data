//
//  Meal+CoreDataProperties.swift
//  Meals
//
//  Created by Anand Kulkarni on 7/26/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var mealName: String?
    @NSManaged public var mealType: String?
    @NSManaged public var rawMealTime: NSDate?

}
