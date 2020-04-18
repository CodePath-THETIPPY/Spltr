//
//  ItemTableViewCell.swift
//  KAT
//
//  Created by Tu Anh Nguyen on 4/17/20.
//  Copyright © 2020 KAT. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var Item: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
