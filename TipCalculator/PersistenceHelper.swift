//
//  PersistenceHelper.swift
//  TipCalculator
//
//  Created by Jonathan Kim on 1/10/15.
//  Copyright (c) 2015 Jonathan Kim. All rights reserved.
//

import Foundation

func setDefaultTipPercentage(tipPercentage: Double)
{
    var defaults = NSUserDefaults.standardUserDefaults()
    defaults.setDouble(tipPercentage, forKey: "defaultTipPercentage")
    defaults.synchronize()
}

func getDefaultTipPercentage() -> Double
{
    var defaults = NSUserDefaults.standardUserDefaults()
    var defaultTipPercentage = defaults.doubleForKey("defaultTipPercentage")
    return defaultTipPercentage
}