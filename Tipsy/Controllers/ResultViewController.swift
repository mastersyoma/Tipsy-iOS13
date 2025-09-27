//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Simon Sokurenko on 27/09/2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPersonValue: String?
    var settingsText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalPerPersonValue
        settingsLabel.text = settingsText
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
