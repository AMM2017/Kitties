//
//  ViewController.swift
//  CollectionOfKitties
//
//  Created by xcode on 18.11.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

