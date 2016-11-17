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
        
        slider.setValue(Float(lroundf(slider.value)), animated: true)
        
        tipPercentText.text = "\(slider.value)%"
        
        let bill = Double(billValue.text!) ?? 0
        let tip = bill * Double(slider.value / 100)
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

