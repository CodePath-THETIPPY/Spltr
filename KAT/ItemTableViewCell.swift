//
//  ItemTableViewCell.swift
//  KAT
//
//  Created by Tu Anh Nguyen on 4/17/20.
//  Copyright © 2020 KAT. All rights reserved.
//

import UIKit
import Contacts

class ItemTableViewCell: UITableViewCell, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var Item: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    // @IBOutlet weak var recipientsLabel: UILabel!
    // @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var recipientsTextField: UITextField!
    
    var contacts = [String]()
    var addingAnotherContact = [String]()
    var price : Double = 0
    var count : Double = 1
    
    var refresh : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contacts = fetchContacts()
        createPickerView()
        dismissPickerView()
        
    }


    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func fetchContacts() -> Array<String> {
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return contacts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return contacts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if !addingAnotherContact.contains(contacts[row]) {
            addingAnotherContact.append(contacts[row])
        }
        
        recipientsTextField.text = contacts[row]
        
        if addingAnotherContact.count > 1 {
            recipientsTextField.text = addingAnotherContact.joined(separator: ", ")
        }
        
        count = Double(addingAnotherContact.count)
        
        price = newPrice(p: price, c: count)
        
        priceLabel.text = String(format:"$%.2f", price)
        
    }
    
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        recipientsTextField.inputView = pickerView
    }

    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
     
        recipientsTextField.inputAccessoryView = toolBar
    }

    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    
    func newPrice (p: Double, c: Double) -> Double{
        let finalPrice = p / c
        return finalPrice
        
    }
}
