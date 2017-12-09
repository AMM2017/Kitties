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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    enum imgNames {
        case Tom, Jerry, Richi
        public name: String {
            switch self{
            case .Tom:
                return "cat256"
            case .Jerry:
                return "kitty1"
            case .Richi:
                return "cat256"
            }
        }
    }
    
    @IBAction func controlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                imageView.image = UIImage(named: imgNames.Tom)
                newKitty.imageName = imgNames.Tom
            case 1:
                imageView.image = UIImage(named: imgNames.Jerry)
                newKitty.imageName = imgNames.Jerry
            case 2:
                imageView.image = UIImage(named: imgNames.Richi)
                newKitty.imageName = imgNames.Richi
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
        
        newKitty.imageName = imgSegmentedControl.imageForSegment(at: imgSegmentedControl.selectedSegmentIndex)?.accessibilityIdentifier ?? "cat256"
        
        let realm = try! Realm()
        try! realm.write{
            realm.add(newKitty)
        }
        
        self.dismiss(animated: true)
    }
}
