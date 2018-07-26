//
//  SingleMealViewController.swift
//  Meals
//
//  Created by Anand Kulkarni on 7/26/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class SingleMealViewController: UIViewController {

    @IBOutlet weak var mealName: UITextField!
    @IBOutlet weak var mealType: UITextField!
    @IBOutlet weak var mealTime: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealName.delegate = self as UITextFieldDelegate
        mealType.delegate = self as UITextFieldDelegate
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mealName.resignFirstResponder()
        mealType.resignFirstResponder()
    }
    @IBAction func saveMeal(_ sender: Any) {
        let name = mealName.text
        let type = mealType.text
        let time = mealTime.date
        
        if let meal = Meal(mealName: name, mealType: type, mealTime: time) {
            do {
                let managedContext = meal.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch{
                print("Context could not be saved")
            }
        }
        
    }
    
}
extension SingleMealViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
