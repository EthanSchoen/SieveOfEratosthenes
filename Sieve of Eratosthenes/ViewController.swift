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
    
    func primes_on_the_fly(primes: inout [Int], start: Int, n: Int) -> [Int] {
        if primes.count == 0 {
            let p = get_n_primes(n: n)
            var index = 0;
            for i in p {
                if i {
                    primes.append(index)
                }
                index += 1
            }
            return primes
        }
        for i in start...n {
            var isPrime = true
            for p in primes {
                if Double(i/p) == Double(i)/Double(p) {
                    isPrime = false;
                }
            }
            if isPrime {
                primes.append(i)
            }
        }
        return primes;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        var p = [Int]()
//        var s = 0
//        for i in 1...10 {
//            p = primes_on_the_fly(primes: &p, start: s, n: i*10)
//            s = i*10
//            sleep(1)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

