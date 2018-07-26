//
//  MealsViewController.swift
//  Meals
//
//  Created by Anand Kulkarni on 7/26/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit
import CoreData

class MealsViewController: UIViewController {

    @IBOutlet weak var mealsTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.timeStyle = .medium
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Meal> = Meal.fetchRequest()
        
        do{
            meals = try managedContext.fetch(fetchRequest)
            
            mealsTableView.reloadData()
        } catch {
            print("Fetch could not be performed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addMeals(_ sender: Any) {
        performSegue(withIdentifier: "showMeals", sender: self)
    }
}
extension MealsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mealsTableView.dequeueReusableCell(withIdentifier: "mealCell", for:indexPath)
        let meal = meals[indexPath.row]
        
        cell.textLabel?.text = meal.mealName
        
        if let time = meal.mealTime {
            cell.detailTextLabel?.text = dateFormatter.string(from: time)
        }
        return cell
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
