//
//  ViewController.swift
//  QuickTip
//
//  Created by Malcolm Treacy on 8/2/20.
//  Copyright © 2020 Straykite Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var suggestedTip: UITextField!
    
    @IBOutlet weak var suggestedTipTotal: UITextField!
    
    @IBOutlet weak var correctOrIncorrect: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.green
    }
    
   
    /*
     onTap:
     Description:In IOS all code usually starts with an action.  This tap gesture recognizer closes the number pad when the user selects anywhere else on the number pad.
     */
    @IBAction func onTap(_ sender: Any) {
    // Code for dismissing a keyboard:
        view.endEditing(true)
        
    }
    
    /*
     calculateTip:
     Description: Function will recalculate the bill each time the user makes a change to the input field.
     3 Routines:
        1.
     */
    @IBAction func calculateTip(_ sender: Any) {
        
         let bill = Double(billField.text!) ?? 0
        
        // Calculate the Tip and Total Labels
        let tipPercentages = [ 0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    
    @IBAction func checkTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        var suggestedTipPercentage = Double(suggestedTip.text!) ?? 0
        suggestedTipPercentage = suggestedTipPercentage / 100
        
        let suggestedTipTot = Double(suggestedTipTotal.text!) ?? 0
        
        if (suggestedTipPercentage * bill == suggestedTipTot) {
            
            correctOrIncorrect.text = "CORRECT!"
        }
        else{
            correctOrIncorrect.text = "INCORRECT!"
        }
        
    }
    
}

