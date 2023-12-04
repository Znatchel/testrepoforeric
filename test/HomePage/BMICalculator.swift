//
//  BMICalculator.swift
//  HomePage
//
//  Created by Mitchell Ryan 200474224
// this class calculates the users current body mass index score.

import Foundation

class BMICalculator {
   
    // calculation the BMI
    func calculateBMI(weight: Double, height: Double) -> Double {
       
        // returning the BMI
        return weight / (height * height)
    }
}
