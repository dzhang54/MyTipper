//
//  ReceiptViewController.swift
//  MyTipper
//
//  Created by Daniel Zhang on 12/5/15.
//  Copyright © 2015 Daniel Zhang. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var ratingView: GoodOrBad!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var meal: Meal?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalTextField.delegate = self
        
        checkValidMealName()

        // Do any additional setup after loading the view.
    }
    //Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let totalz = "$" + totalTextField.text!
            let peoplez = peopleTextField.text
            let datez = dateTextField.text
            let ratingz = ratingView.rating 
            
            meal = Meal(date: datez!, people: peoplez!, rating: ratingz, totalBill: totalz)
            
           
        }
    }
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.enabled = false
    }
    func checkValidMealName() {
        // Disable the Save button if the text field is empty.
        let text = totalTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
