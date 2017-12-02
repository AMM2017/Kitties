//
//  ViewController.swift
//  CollectionOfKitties
//
//  Created by xcode on 18.11.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UICollectionViewController {

    //public var kitties: [Kitty] = []
    public var kitties: Results<Kitty>!{
        let realm = try! Realm()
        return realm.objects(Kitty.self)
    }
    
    @IBAction func addBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "AddViewSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController{
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kitties?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath)
            as? CollectionViewCell
            else {
                fatalError("Type error")
            }
        let model: Kitty = kitties[indexPath.item]
        cell.configure(name: model.name, imgPath: model.imagePath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
}

