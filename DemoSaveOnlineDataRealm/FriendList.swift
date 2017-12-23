//
//  FriendList.swift
//  DemoSaveOnlineDataRealm
//
//  Created by MacBook Pro on 24/12/2017.
//  Copyright © 2017 MacBook Pro. All rights reserved.
//

import UIKit
import RealmSwift

class FriendList: Object {
    @objc dynamic var Name : String = ""
    @objc dynamic var Subject : String = ""
}
