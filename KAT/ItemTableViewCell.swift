//
//  ItemTableViewCell.swift
//  KAT
//
//  Created by Tu Anh Nguyen on 4/17/20.
//  Copyright © 2020 KAT. All rights reserved.
//

import UIKit
import Contacts

class ItemTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var Item: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var recipientsLabel: UILabel!
    var indexPath: IndexPath!
    var delegate: ContactsPickingDelegate!
    var selectedNames = [String]()
    var costPerPerson: Double = 0.0
    
    @IBAction func btnAddRecipient(_ sender: Any) {
        // tell the VC to pull up the picker for indexpath
        delegate.showPicker(forCell: indexPath)
    }
    
    func didSelectRecipientInPicker(name: String) {
        // add "name" string to array
        // update label contents
        if !selectedNames.contains(name) {
            selectedNames.append(name)
        }
        
        recipientsLabel.text = selectedNames.joined(separator: ", ")
        let divideBy = Double(selectedNames.count)
        priceLabel.text = String(format: "$%.2f", (costPerPerson / divideBy))
    }
    
    var selectedContacts = [String]()
    var price: Double = 0.0
    var count: Double = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //contacts = fetchContacts()
        //createPickerView()
        //dismissPickerView()
        
        /*
        addButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        addButton.layer.shadowRadius = 5
        addButton.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        addButton.layer.shadowOpacity = 1.0
        */
        
        // Initialization code
    }
    
    func getAmount(p: Double) -> Double {
        let newPrice = p / count
        print(p)
        print(count)
        //print(addingAnotherContact.count)
        print(newPrice)
        return newPrice
    }

    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
}
