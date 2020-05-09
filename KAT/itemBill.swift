//
//  itemBill.swift
//  KAT
//
//  Created by Tu Anh Nguyen on 5/8/20.
//  Copyright © 2020 KAT. All rights reserved.
//

import UIKit

class itemBill: NSObject {
    
    var finalPrice : Double = 0.0
    var itemName : String = ""

    override init(){}
    init(name:String,price:Double){
        self.itemName = name
        self.finalPrice = price

    }
}
