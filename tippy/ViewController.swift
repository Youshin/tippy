//
//  ViewController.swift
//  tippy
//
//  Created by 김유신 on 2017. 12. 20..
//  Copyright © 2017년 Youshin Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentage: UISegmentedControl!
    @IBOutlet weak var pickState: UIPickerView!
    @IBOutlet weak var stateTax: UILabel!
    
    let states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California","Colorado","Connecticut", "Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateTax.text = states[row]
        let state = stateTax.text ?? ""
        var tax = 1.00
        switch state{
        case "Alabama":
            tax = 1.04
        case "Arizona":
            tax = 1.056
        case "Arkansas":
            tax = 1.065
        case "California":
            tax = 1.0725
        case "Colorado":
            tax = 1.029
        case "Connecticut":
            tax = 1.0635
        case "Florida":
            tax = 1.06
        case "Georgia":
            tax = 1.04
        case "Hawaii":
            tax = 1.04
        case "Idaho":
            tax = 1.06
        case "Illinois":
            tax = 1.0625
        case "Indiana":
            tax = 1.07
        case "Iowa":
            tax = 1.06
        case "Kansas":
            tax = 1.065
        case "Kentucky":
            tax = 1.06
        case "Louisiana":
            tax = 1.05
        case "Maine":
            tax = 1.055
        case "Maryland":
            tax = 1.06
        case "Massachusetts":
            tax = 1.0625
        case "Michigan":
            tax = 1.06
        case "Minnesota":
            tax = 1.06875
        case "Mississippi":
            tax = 1.07
        case "Missouri":
            tax = 1.04225
        case "Nebraska":
            tax = 1.055
        case "Nevada":
            tax = 1.0685
        case "New Jersey":
            tax = 1.06625
        case "New Mexico":
            tax = 1.05125
        case "New York":
            tax = 1.04
        case "North Carolina":
            tax = 1.0475
        case "North Dakota":
            tax = 1.05
        case "Ohio":
            tax = 1.0575
        case "Oklahoma":
            tax = 1.045
        case "Pennsylvania":
            tax = 1.06
        case "Rhode Island":
            tax = 1.07
        case "South Carolina":
            tax = 1.06
        case "South Dakota":
            tax = 1.045
        case "Tennessee":
            tax = 1.07
        case "Texas":
            tax = 1.0625
        case "Utah":
            tax = 1.047
        case "Vermont":
            tax = 1.06
        case "Virginia":
            tax = 1.043
        case "Washington":
            tax = 1.065
        case "West Virginia":
            tax = 1.06
        case "Wisconsin":
            tax = 1.05
        case "Wyoming":
            tax = 1.04
        default:
            tax = 1.00
        }
        
        let tipPercentages = [0.18, 0.20, 0.25]
        let bill  = Double(billField.text!) ?? 0
        let taxBill = bill * tax
        let tip = taxBill * tipPercentages[tipPercentage.selectedSegmentIndex]
        let total = taxBill + tip
        
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
        stateTax.text = String(format:"%.2f%%",tax)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let state = stateTax.text ?? ""
        
        var tax = Double(state.substring(to: state.index(before: state.endIndex))) ?? 0.00

        
        let tipPercentages = [0.18, 0.20, 0.25]
        let bill  = Double(billField.text!) ?? 0
        let taxBill = bill * tax
        let tip = taxBill * tipPercentages[tipPercentage.selectedSegmentIndex]
        let total = taxBill + tip
        
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
        
    }
    
   
}

