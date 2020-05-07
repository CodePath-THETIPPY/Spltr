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
    @IBOutlet weak var nameTextField: SearchTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
/*
    func fetchContacts() -> Array<String> {
        print("Attempting to fetch contacts...")
        
        let store = CNContactStore()
        var contacts = [String]()
        
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print("Failed to request access: ", err)
                return
            }
            if granted {
                print("Access granted")
                
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                do {
                    try store.enumerateContacts(with: request)  { (contact, stopPointerIfYouWantToStopEnumerating) in
                        // print(contact.givenName)
                        // print(contact.familyName)
                        let fullName = contact.givenName + " " + contact.familyName
                        contacts.append(fullName)
                    }
                } catch let err {
                    print("Failed to enumerate contacts: ", err);
                }
                print(contacts)
            } else {
                print("Access denied...")
            }
        }
        return contacts
    }
*/
    
}
