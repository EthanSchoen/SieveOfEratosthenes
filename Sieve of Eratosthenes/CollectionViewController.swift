//
//  CollectionViewController.swift
//  Sieve of Eratosthenes
//
//  Created by Ethan Schoen on 12/19/16.
//
//

import UIKit

private let reuseIdentifier = "NumberCell"

class CollectionViewController: UICollectionViewController {

    var numbers = [Bool]() // True means index+1 is a prime number
    var amt = Int()
    var is_finite = Bool()
    var thread = Timer()
    
    func get_n_primes(n: Int) -> [Bool]{
        var naturals = [Bool](repeating: true, count: n) // true means prime, start with all true
        naturals[0] = false // 1 is not prime
        for i in 1..<n {
            if naturals[i] {
                var j = 2;
                while j*(i+1) < n {
                    naturals[(j*(i+1))-1] = false
                    j += 1
                }
            }
        }
        return naturals
    }
    
    func primes_on_the_fly(primes: inout [Bool], n: Int) {
        if primes.count == 0 {
            primes = get_n_primes(n: n)
        }
        let start = primes.count
        for _ in 0..<n {
            primes.append(true)
        }
        for i in (start+1)...primes.count {
            for p in 2..<i {
                //print("I: ", i, "   P: ", p)
                //print(Double(i/p), Double(i)/Double(p))
                if primes[p-1], Double(i/p) == Double(i)/Double(p) {
                    primes[i-1] = false;
                }
            }
        }
    }
    
    func runThread(){
        DispatchQueue.main.async {
            print("run")
            self.primes_on_the_fly(primes: &self.numbers, n: 10)
            self.collectionView?.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        thread.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if is_finite {
            numbers = get_n_primes(n: amt)
        } else {
            thread = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(CollectionViewController.runThread), userInfo: nil, repeats: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return numbers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        // Configure the cell
        cell.numLabel.text = String(indexPath.item+1)
        cell.backgroundColor = numbers[indexPath.item] ? UIColor.green : UIColor.lightGray
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
