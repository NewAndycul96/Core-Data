//
//  Meal+CoreDataClass.swift
//  Meals
//
//  Created by Anand Kulkarni on 7/26/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Meal)
public class Meal: NSManagedObject {
    var mealTime: Date? {
        get{
            return rawMealTime as Date?
        }
        set {
            rawMealTime = newValue as NSDate?
        }
    }
    convenience init?(mealName: String?, mealType: String?, mealTime: Date?){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Meal.entity(), insertInto: managedContext)
        
        self.mealName = mealName
        self.mealType = mealType
        self.mealTime = mealTime
    }
}
