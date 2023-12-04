//
//  CalroieDeficitCalculator.swift
//  HomePage
//
//  Created by Mitchell Ryan 200474224
// this class performs the calculations on what recommended calorie deficit is needed

import Foundation


class CalorieDeficitCalculator {
    // calculation calorie deficit
    func calculateCalorieDeficit(currentWeight: Double, targetWeight: Double, caloriesPerKg: Double) -> Double {
        let weightLoss = currentWeight - targetWeight
        let calorieDeficit = weightLoss * caloriesPerKg
      
        //returning calorie deficit
        return calorieDeficit
    }
}
