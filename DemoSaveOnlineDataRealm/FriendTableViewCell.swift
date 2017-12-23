//
//  FriendTableViewCell.swift
//  DemoSaveOnlineDataRealm
//
//  Created by MacBook Pro on 24/12/2017.
//  Copyright © 2017 MacBook Pro. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var labSubject: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
