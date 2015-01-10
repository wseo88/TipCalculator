//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Jonathan Kim on 1/10/15.
//  Copyright (c) 2015 Jonathan Kim. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Helper Methods
    @IBAction func onEightTeenPercentButtonPressed(sender: AnyObject)
    {
        setDefaultTipPercentage(0.18)
    }

    @IBAction func onTwentyPercentButtonPressed(sender: AnyObject)
    {
        setDefaultTipPercentage(0.20)
    }

    @IBAction func onTwentyTwoPercentButtonPressed(sender: AnyObject)
    {
        setDefaultTipPercentage(0.22)
    }

    @IBAction func onExitBarbButtonItemPressed(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
}
