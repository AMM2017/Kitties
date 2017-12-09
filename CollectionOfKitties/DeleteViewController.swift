//
//  DeleteViewController.swift
//  CollectionOfKitties
//
//  Created by xcode on 02.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class DeleteViewController: UIViewController {
    var kitty: Kitty!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        imageView.image = UIImage(named: kitty.imageName)
        nameLabel.text = kitty.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnDeletePressed(_ sender: UIButton) {
        let realm = try! Realm()
        try! realm.write{
            realm.delete(kitty)
        }
        
        self.dismiss(animated: true)
    }
}
