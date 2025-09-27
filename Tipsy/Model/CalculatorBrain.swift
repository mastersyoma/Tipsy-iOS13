//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Simon Sokurenko on 27/09/2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var text: String = ""
    var numberOfPeople: Int = 2
    var tipPercentage: Double = 0.0
    var totalPerPerson: String = "0.0"
        
    mutating func getTotalPerPerson(bill: String, tipPercentage: Double, numberOfPeople: Int) {
        let billAmount = Double(bill) ?? 0.0
        let totalWithTip = billAmount * (1 + tipPercentage)
        totalPerPerson = String(format: "%.2f", totalWithTip / Double(numberOfPeople))
    }

}
