//
//  ItemsViewController.swift
//  
//
//  Created by Tu Anh Nguyen on 4/17/20.
//

import UIKit
import Contacts
import SearchTextField
import BLTNBoard

protocol ContactsPickingDelegate {
    func showPicker(forCell at: IndexPath)
}

class ItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, ContactsPickingDelegate {
    
    var contacts = [String]()
    var selectingForCellAt: IndexPath!
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    
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
        
        //
    }
    
    func showPicker(forCell at: IndexPath) {
        selectingForCellAt = at
        
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
        
        picker = UIPickerView.init()
        picker.delegate = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)

        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = UIBarStyle.default
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }
    
    @objc func onDoneButtonTapped() {
        let selectedName = contacts[picker.selectedRow(inComponent: 0)]
        let cell = itemsTableView.cellForRow(at: selectingForCellAt) as! ItemTableViewCell
        cell.didSelectRecipientInPicker(name: selectedName)
        
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }

    @IBOutlet weak var itemsTableView: UITableView!
    
    
    // let nameTextField = SearchTextField(frame: CGRect(x: 10, y: 100, width: 200, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts = fetchContacts()
        
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        
        // Do any additional setup after loading the view.
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // change to correct count from reciept
        let count = 4
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemsTableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemTableViewCell
        
        if(indexPath.row == 0)
        {
            cell.Item.text = "SM Calamari"
            cell.priceLabel.text = "$11.98"

        }
        
        if(indexPath.row == 1)
        {
            cell.Item.text = "Lobster Roll"
            cell.priceLabel.text = "$25.00"
        }
        
        if(indexPath.row == 2)
        {
            cell.Item.text = "Kale Salad - Shrimp"
            cell.priceLabel.text = "$18.00"
        }
        
        if(indexPath.row == 3)
        {
            cell.Item.text = "Snapper Entree"
            cell.priceLabel.text = "$28.00"
        }
        
        cell.indexPath = indexPath
        cell.delegate = self
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
