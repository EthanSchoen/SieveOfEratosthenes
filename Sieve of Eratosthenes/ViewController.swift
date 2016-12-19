//
//  ViewController.swift
//  Sieve of Eratosthenes
//
//  Created by Ethan Schoen on 12/19/16.
//
//

import UIKit

class ViewController: UIViewController {
    
    func get_n_primes(n: Int) -> [Bool]{
        var naturals = [Bool](repeating: true, count: n) // true means prime, start with all true
        // 0 and 1 are not prime
        naturals[0] = false
        naturals[1] = false
        for i in 2..<n {
            if naturals[i] {
                var j = i;
                while j*i < n {
                    naturals[j*i] = false
                    j += 1
                }
            }
        }
        for i in 0..<n {
            if naturals[i] {
                print(i, "is a prime")
            }
        }
        return naturals
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        get_n_primes(n: 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

