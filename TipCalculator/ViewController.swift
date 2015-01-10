//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jonathan Kim on 1/9/15.
//  Copyright (c) 2015 Jonathan Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitBillControl: UISegmentedControl!
    @IBOutlet weak var splitAmountLabel: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tipLabel.text = defaultTotalLabelText
        totalLabel.text = defaultTipLabelText
        splitAmountLabel.text = defaultSplitAmountLabelText

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject)
    {
        var tipPercentage = defaultTipPercentages[tipControl.selectedSegmentIndex]

        

        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip

        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject)
    {
        view.endEditing(true)
    }

}

