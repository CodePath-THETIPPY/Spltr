//
//  ItemTableViewCell.swift
//  KAT
//
//  Created by Tu Anh Nguyen on 4/17/20.
//  Copyright © 2020 KAT. All rights reserved.
//

import UIKit
import Contacts

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var Item: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        addButton.layer.shadowRadius = 5
        addButton.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        addButton.layer.shadowOpacity = 1.0
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
