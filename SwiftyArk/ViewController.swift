//
//  ViewController.swift
//  SwiftyArk
//
//  Created by Andrew on 2017-09-16.
//  Copyright © 2017 Walzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate    var delegates: [Delegate] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.isHidden = true
        
        let manager = ArkManager()
        
        manager.sendTransaction("AYdHH5TsZF796pv7gxVU1tK6DLkUxMK1VL", amount: 0.001, passphrase: "benefit spice mansion cage pig adjust lawsuit violin goddess mistake trip baby", secondPassphrase: nil, vendorField: "test") { (error, response) in
            print(error)
            print(response)
        }
        

        manager.delegates { (error, delegates) in
            if let aError = error {
                print(aError)
                return
            }
            
            if let currentDelegates = delegates {
                self.delegates = currentDelegates
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: UITableViewDataSource
extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let delegate = delegates[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(delegate.rate). \(delegate.username)"
        return cell
    }
    
    
}

