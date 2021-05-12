//
//  ViewController.swift
//  Budget List
//
//  Created by Duc Huynh on 4/27/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var field1: UITextField?
    @IBOutlet var field2: UITextField?
    @IBOutlet var field3: UITextField?
    @IBOutlet var field4: UITextField?
    @IBOutlet var field5: UITextField?
    @IBOutlet var field6: UITextField?
    @IBOutlet var field7: UITextField?
    @IBOutlet var total: UITextField?
    @IBOutlet var taxRate: UITextField?
    @IBOutlet var limit: UITextField?
    var sum: Float = 0.0
    var maxBudget: Float!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    @IBAction func updateTotal(_ sender: UIButton){
        let price1 = Float(field1!.text!) ?? 0.0
        let price2 = Float(field2!.text!) ?? 0.0
        let price3 = Float(field3!.text!) ?? 0.0
        let price4 = Float(field4!.text!) ?? 0.0
        let price5 = Float(field5!.text!) ?? 0.0
        let price6 = Float(field6!.text!) ?? 0.0
        let price7 = Float(field7!.text!) ?? 0.0
        
        maxBudget = Float(limit!.text!) ?? 999999
        limit!.text = String(maxBudget)
        
        sum = price1 + price2 + price3 + price4 + price5 + price6 + price7

        if taxRate!.text != nil && (Float(taxRate!.text!) ?? 0) > 0 {
            if Float(taxRate!.text!) ?? 0 > 1 {
                taxRate!.text = String((Float(taxRate!.text!) ?? 0)/100)
            }
            sum = (sum*Float(taxRate!.text!)!) + sum
        }
        
        
        if sum <= maxBudget {
            total!.text = String(sum)
        }
        else {
            total!.text = "OVER"
        }
    }

}

