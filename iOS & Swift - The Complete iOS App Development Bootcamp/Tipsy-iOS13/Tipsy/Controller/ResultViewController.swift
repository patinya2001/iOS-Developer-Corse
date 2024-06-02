//
//  ResultViewController.swift
//  Tipsy
//
//  Created by ปฏิญญา จารุอริยานนท์ on 24/4/2567 BE.
//  Copyright © 2567 BE The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var pct: String?
    var splitNumber: String?
    var totalBill: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalBill
        settingsLabel.text = "Split between \(splitNumber ?? "0") people, with \(pct ?? "0%") tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
