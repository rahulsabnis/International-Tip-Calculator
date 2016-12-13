//
//  ViewController.swift
//  TipCalculator
//
//  Created by Rahul Sabnis on 11/16/16.
//  Copyright © 2016 Rahul Sabnis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipPercentText: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var billValue: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = NSLocale.current
        
        slider.setValue(Float(lroundf(slider.value)), animated: true)
        
        tipPercentText.text = "\(slider.value)%"
        
//        var bill = NSString(string: billValue.text!).doubleValue
//        var tip = NSString(string: slider.value!).doubleValue
        
        let bill = Double(billValue.text!) ?? 0
        let tip = bill * Double(slider.value / 100)
        let total = bill + tip
        
        tipLabel.text = currencyFormatter.string(from: NSNumber(value:tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value:total))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
}

