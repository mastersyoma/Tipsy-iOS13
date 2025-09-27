//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipPercentage: Double = 0.0
    var numberOfPeople: Int = 2
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twenttyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if sender === twenttyPctButton {
            twenttyPctButton.isSelected = true
            tipPercentage = 0.2
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
        } else if sender === tenPctButton {
            tenPctButton.isSelected = true
            tipPercentage = 0.1
            twenttyPctButton.isSelected = false
            zeroPctButton.isSelected = false
        } else {
            zeroPctButton.isSelected = true
            tipPercentage = 0.0
            twenttyPctButton.isSelected = false
            tenPctButton.isSelected = false
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.getTotalPerPerson(bill: billTextField.text ?? "0.0", tipPercentage: tipPercentage, numberOfPeople: numberOfPeople)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalPerPersonValue = calculatorBrain.totalPerPerson
            destinationVC.settingsText = "Split between \(numberOfPeople) people, with \(Int(tipPercentage * 100))% tip."
        }
    }
}
