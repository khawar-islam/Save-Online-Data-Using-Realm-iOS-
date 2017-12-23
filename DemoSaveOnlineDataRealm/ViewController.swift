//
//  ViewController.swift
//  DemoSaveOnlineDataRealm
//
//  Created by MacBook Pro on 23/12/2017.
//  Copyright © 2017 MacBook Pro. All rights reserved.
//

import UIKit
import RealmSwift
import FirebaseDatabase
import Realm

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrFriends : [FriendList] = Array()
    let user = User()
    
    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFriendData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        cell.labName.text = arrFriends[indexPath.row].Name
        cell.labSubject.text = arrFriends[indexPath.row].Subject
        return cell
    }
   
    func getFriendData() {
        let ref = Database.database().reference(withPath: "Friends")
        print(ref)
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            
            print(snapshot) // Its print all values including Snap (Stations)
            
            print(snapshot.value!)
            print(snapshot.children.allObjects)
            for rest in snapshot.children.allObjects as! [DataSnapshot] {
                self.arrFriends.append(FriendList(value: rest.value!))
                self.saveRealmArray(self.arrFriends)
                self.tableView.reloadData()
            }

        })
    }

    func saveRealmArray(_ objects: [Object]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(objects)
        }
    }


}

