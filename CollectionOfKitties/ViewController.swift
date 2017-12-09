//
//  ViewController.swift
//  CollectionOfKitties
//
//  Created by xcode on 18.11.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var currentKitty: Kitty!
    
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kitties?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath)
            as? CollectionViewCell
            else {
                fatalError("Type error")
        }
        let model: Kitty = kitties[indexPath.item]
        cell.configure(name: model.name, imgName: model.imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentKitty = kitties[indexPath.item]
        performSegue(withIdentifier: "DeleteViewSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DeleteViewSegue"{
            guard let targetController = segue.destination as? DeleteViewController else {
                fatalError("Segue error");
            }
            targetController.kitty = currentKitty
        }
    }
    
}

