//
//  ViewController.swift
//  HomePage
//
//  Created by Mitchell Ryan 200474224
// this is the view controller class for the BMI calculator and calorie deficit calculator
// it also has a reference to the foodView I.E the MealViewController

import UIKit

class ViewController: UIViewController {
    
    // data outlets
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var activityLevelTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    // defining functions
    let bmiCalculator = BMICalculator()
    let calorieDeficitCalculator = CalorieDeficitCalculator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
// this function swaps to the MealViewController
    @IBAction func changeview(_ sender: UIButton) {
        
        guard let viewControl = storyboard?.instantiateViewController(identifier: "foodView") as? MealViewController else {
            print("failed to generate View")
             return
         }
         present(viewControl, animated: true)
    }
    // this function begins the calculations on BMI and calorie deficit
    @IBAction func calculateBMI(_ sender: UIButton) {
        calculateBMI()
        
    }
    
    // this function contains the calculations for BMI
    func calculateBMI() {
        guard
            let weightText = weightTextField.text,
            let heightText = heightTextField.text,
            let activityLevelText = activityLevelTextField.text
        else {
            return
        }
        
        guard
            let weight = Double(weightText),
            let height = Double(heightText),
            let activityLevel = Double(activityLevelText)
        else {
            resultLabel.text = "Invalid input"
            return
        }
        let bmi = bmiCalculator.calculateBMI(weight: weight, height: height)
        
        // Dynamically calculate target weight based on BMI within a healthy range
        let targetBMI: Double = 22.5
        let targetWeight = targetBMI * (height * height)
        
        // Dynamically calculate calories per kilogram based on activity level
        let caloriesPerKg = 7700 / activityLevel
        
        // Calculate weight loss in kilograms
        let weightLoss = weight - targetWeight
        
        // Calculate daily calorie deficit over a period of 3 months
        let daysInThreeMonths: Double = 90.0
        let dailyCalorieDeficit = weightLoss * caloriesPerKg / daysInThreeMonths
        
        resultLabel.numberOfLines = 0
        resultLabel.lineBreakMode = .byWordWrapping
        resultLabel.text = "BMI: \(String(format: "%.2f", bmi))\nRecommended Daily Calorie Deficit: \(String(format: "%.2f", dailyCalorieDeficit)) calories over 3 months"
    }
}
