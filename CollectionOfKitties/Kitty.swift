//
//  Kitty.swift
//  CollectionOfKitties
//
//  Created by xcode on 18.11.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import UIKit
import RealmSwift

public class Kitty: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var imageName: String = ""
}
