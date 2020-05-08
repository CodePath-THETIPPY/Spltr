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

class ItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var itemsTableView: UITableView!

    
    
    // let nameTextField = SearchTextField(frame: CGRect(x: 10, y: 100, width: 200, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // change to correct count from reciept
        let count = 4
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemsTableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemTableViewCell
        
        // cell.nameTextField.delegate = self
        // cell.nameTextField.filterStrings(fetchContacts())
        
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
