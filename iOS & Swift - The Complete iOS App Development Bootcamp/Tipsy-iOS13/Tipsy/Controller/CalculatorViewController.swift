//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tenPctButton.isSelected = true
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text ?? "0"
        let splitNumber = splitNumberLabel.text ?? "0"
        
        if zeroPctButton.isSelected {
            calculatorBrain.calculateTotalBill(bill: bill, splitNumber: splitNumber, pct: zeroPctButton.currentTitle ?? "0")
        } else if tenPctButton.isSelected {
            calculatorBrain.calculateTotalBill(bill: bill, splitNumber: splitNumber, pct: tenPctButton.currentTitle ?? "0")
        } else {
            calculatorBrain.calculateTotalBill(bill: bill, splitNumber: splitNumber, pct: twentyPctButton.currentTitle ?? "0")
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.pct = calculatorBrain.getPct()
            destinationVC.splitNumber = splitNumberLabel.text
            destinationVC.totalBill = calculatorBrain.getTotalBill()
        }
    }
}

