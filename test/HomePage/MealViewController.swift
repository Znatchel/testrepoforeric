//
//  MealViewController.swift
//  HomePage
//
//  Created by Mitchell Ryan 200474224.
//  This view controller class handles the Mealview controller allowing for the display of recipes to meet Macro calorie goals

import UIKit

class MealViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
// defining my data structure
    
    struct Meals {
        
        let name: String
        let imageName: String
        
    }
    
    // adding content to the array
    let data: [Meals] = [
        Meals(name: "Chicken Parm: 1000 Calories", imageName:"Food1" ),
        Meals(name: "Salad: 400 Calories", imageName:"Food2" ),
        Meals(name: "Steak Frites: 1500 Calories ", imageName:"Food3" ),
        Meals(name: "Veggie Wrap: 400 Calories ",imageName:"Food4" ),
    
    ]
    
    @IBOutlet weak var table: UITableView!
    
    // adding delegation to the table
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        view.backgroundColor = .blue
      
    }
    // find the number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    // finds and configures a cell for the return based on row index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // retrieve meal data for the current row
        let meals = data[indexPath.row]
        
        //deque a reusable cell for "mitchcell"
        let cell = table.dequeueReusableCell(withIdentifier: "mitchCell", for: indexPath) as! MealTableViewCell
        // setting the text information and image
        cell.labelView.text = meals.name
        cell.iconImageView.image = UIImage(named: meals.imageName)
        
        // returning the configured cell
        return cell
        
    }
    

}
