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
    @IBOutlet weak var tipAmountLabel: UILabel!

    var numberOfSplits: Int!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Set up initial tip amount label
        var defaultTipFloat = getDefaultTipPercentage() * 100
        var defaultTipPercentage = (defaultTipFloat as NSNumber).intValue
        tipAmountLabel.text = "Tip (\(defaultTipPercentage)%):"

        tipLabel.text = defaultTotalLabelText
        totalLabel.text = defaultTipLabelText
        splitAmountLabel.text = defaultSplitAmountLabelText

        // Initialize numberOfSplits
        numberOfSplits = 1
    }

    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)

        // Get current tip percentage using NSUserDefault
        var currentTipPercentage = getDefaultTipPercentage()

        // Have current tip percentage selected when root view controller appears
        updateTipControlLabelIndex(currentTipPercentage)

        // Update tip amount label after updating the tip control index...
        updateTipAmount()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject)
    {
        updateTipAndTotalLabels()
        updateTipAmount()
    }

    @IBAction func onTap(sender: AnyObject)
    {
        view.endEditing(true)
    }

    // Helper Methods
    func updateTipControlLabelIndex(tipPercentage: Double)
    {
        tipControl.selectedSegmentIndex = find(defaultTipPercentages, tipPercentage)!
    }

    func updateTipAmount()
    {
        var tipInDecimal = defaultTipPercentages[tipControl.selectedSegmentIndex]
        var tipPercentage = tipInDecimal * 100
        tipAmountLabel.text = String(format: "Tip (%.f%%):", tipPercentage)
    }

    func updateTipAndTotalLabels()
    {
        var tipPercentage = defaultTipPercentages[tipControl.selectedSegmentIndex]

        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var splitAmount = total / Double(numberOfSplits)

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitAmountLabel.text = String(format: "$%.2f", splitAmount)
    }

    @IBAction func onSplitBillControlUpdated(sender: AnyObject)
    {
        switch splitBillControl.selectedSegmentIndex
        {
        case 0:
            numberOfSplits = 1
        case 1:
            numberOfSplits = 2
        case 2:
            numberOfSplits = 3
        case 3:
            numberOfSplits = 4
        default:
            break
        }
        updateTipAndTotalLabels()
    }
}

