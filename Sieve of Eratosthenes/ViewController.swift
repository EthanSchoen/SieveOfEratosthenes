//
//  ViewController.swift
//  Sieve of Eratosthenes
//
//  Created by Ethan Schoen on 12/19/16.
//
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var number_input: UITextField!
    @IBOutlet weak var choice: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if identifier == "start" {
            if choice.selectedSegmentIndex == 0 {
                if (number_input.text?.isEmpty)! {
                    number_input.text = ""
                    return false
                } else {
                    let n = Int(number_input.text!)
                    if n == nil || n! < 1 {
                        number_input.placeholder = "Please enter a vaild number"
                        number_input.text = ""
                        return false
                    }
                }
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "start") {
            let embed = segue.destination as! Embed
            embed.finite = (choice.selectedSegmentIndex == 0)
            if let text = number_input.text, !text.isEmpty {
                embed.amount = Int(number_input.text!)!
            } else {
                embed.amount = -1 // if amount is -1 then amount wont be used
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

