//
//  AddViewController.swift
//  CollectionOfKitties
//
//  Created by xcode on 02.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController{
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var imgSegmentedControl: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    
    let newKitty = Kitty()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        imageView.image = UIImage(named: images[0].imgName)
        newKitty.imageName = images[0].imgName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public enum imgNames {
        case Tom, Jerry, Richi
        public var imgName: String {
            switch self{
            case .Tom:
                return "cat1_W80H60px"
            case .Jerry:
                return "cat2_W80_H50px"
            case .Richi:
                return "cat3_W75H75px"
            }
        }
    }
    
    let images: [imgNames] = [imgNames.Tom, imgNames.Jerry, imgNames.Richi]
    
    @IBAction func controlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                imageView.image = UIImage(named: images[0].imgName)
                newKitty.imageName = images[0].imgName
            case 1:
                imageView.image = UIImage(named: images[1].imgName)
                newKitty.imageName = images[1].imgName
            case 2:
                imageView.image = UIImage(named: images[2].imgName)
                newKitty.imageName = images[2].imgName
        default:
            break;
        }
    }
    @IBAction func btnAddPressed(_ sender: UIButton) {
        guard nameTextField.text != "" else{
            let alertController = UIAlertController(title: "Name field can't be empty", message: "Fill the name field, please", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        newKitty.name = nameTextField.text!
        
        let realm = try! Realm()
        try! realm.write{
            realm.add(newKitty)
        }
        
        self.dismiss(animated: true)
    }
}
