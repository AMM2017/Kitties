//
//  CollectionViewCell.swift
//  CollectionOfKitties
//
//  Created by xcode on 20.11.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import UIKit

public class CollectionViewCell : UICollectionViewCell{
    static public let reuseId = "CollectionViewCell_reuseId"
    
    @IBOutlet weak var lblKittyName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    public func configure(name: String, imgName: String){
        lblKittyName.text = name
        imgView.image = UIImage(named: imgName)
    }
}
