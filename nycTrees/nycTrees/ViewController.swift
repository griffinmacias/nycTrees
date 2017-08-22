//
//  ViewController.swift
//  nycTrees
//
//  Created by Mason Macias on 8/22/17.
//  Copyright © 2017 griffinmacias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Network.fetchAllTrees { (json, error) in
            guard error == nil else { return }
            if let json = json {
                print(json)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

