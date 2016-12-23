//
//  Embed.swift
//  Sieve of Eratosthenes
//
//  Created by Ethan Schoen on 12/21/16.
//
//

import UIKit

class Embed: UIViewController {
    
    var amount = Int()
    var finite = Bool()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embed_collection" {
            let controller = segue.destination as! CollectionViewController
            controller.amt = amount
            controller.is_finite = finite
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
    
}
