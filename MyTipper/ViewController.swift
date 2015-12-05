//
//  ViewController.swift
//  MyTipper
//
//  Created by Daniel Zhang on 12/3/15.
//  Copyright © 2015 Daniel Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ratingControl: GoodOrBad!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabell: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabell.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let tipPercentages = [0.10,0.14,0.18,0.2,0.22]
        let tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercent
        let total = billAmount + tip
        
        tipLabell.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        
        
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

