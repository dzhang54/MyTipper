//
//  ViewController.swift
//  MyTipper
//
//  Created by Daniel Zhang on 12/3/15.
//  Copyright © 2015 Daniel Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ratingControl: GoodOrBad!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabell: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var personStepper: UIStepper!

    @IBOutlet weak var taxTotalLabel: UILabel!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var meal: Meal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabell.text = "$0.00"
        totalLabel.text = "$0.00"
        taxTotalLabel.text = "$0.00"
        
        
        let previousChange: NSDate? = defaults.objectForKey("previousChange") as! NSDate?
        if previousChange != nil {
            let tenMinutes: NSTimeInterval = NSDate().timeIntervalSinceDate(previousChange!)
            if Int(tenMinutes) <= 300 {
                billField.text = (defaults.objectForKey("billAmount") as! String)
                self.onEditingChanged(self)
            }
        }
        
        
    }

    override func viewWillAppear(animated: Bool) {
        // show keyboard
        billField.becomeFirstResponder()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipIndex: Int? = defaults.integerForKey("tipDefault")
        
        if let tip = tipIndex {
            tipControl.selectedSegmentIndex = tip
        }
        else {
            tipControl.selectedSegmentIndex = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let previousChange = NSDate()
        
        defaults.setObject(billField.text, forKey: "billAmount")
        defaults.setObject(previousChange, forKey: "previousChange")
        defaults.synchronize()
        var total = 0.0
        personStepper.minimumValue = 1
        
        let tipPercentages = [0.10,0.14,0.18,0.2,0.22]
        let tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercent
        if personStepper.value == 1 {
             total = (billAmount + tip)
        }else{
             total = (billAmount + tip) / personStepper.value
        }
        tipLabell.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total) + "/" + String(Int(personStepper.value)) + " " + "person(s)"
        let taxTotal = (billAmount + (billAmount * 0.0625) + tip) / personStepper.value
        taxTotalLabel.text = String(format: "$%.2f", taxTotal) + "/" + String(Int(personStepper.value)) + " " + "person(s)"
        
        
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
  
}

