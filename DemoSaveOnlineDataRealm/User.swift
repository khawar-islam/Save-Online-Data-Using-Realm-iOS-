//
//  User.swift
//  DemoSaveOnlineDataRealm
//
//  Created by MacBook Pro on 23/12/2017.
//  Copyright © 2017 MacBook Pro. All rights reserved.
//

import UIKit
import RealmSwift

class User: Object {
    
    let Friends = List<FriendList>()

}
