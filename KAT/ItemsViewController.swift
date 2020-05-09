//
//  ItemsViewController.swift
//  
//
//  Created by Tu Anh Nguyen on 4/17/20.
//

import UIKit
import Contacts
import SearchTextField

class ItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var itemsTableView: UITableView!

    let bills = [
        itemBill(name: "SM Calamari", price: 11.98),
        itemBill(name: "Lobster Roll", price: 25.00),
        itemBill(name: "Kale Salad - Shrimp", price: 18.00),
        itemBill(name: "Snapper Entree", price: 28.00),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // change to correct count from reciept
        let count = bills.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemsTableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemTableViewCell

            let bill = bills[indexPath.row]
            let string = String(format:"$%.2f", bill.finalPrice)
            cell.Item.text = bill.itemName
            cell.price = bill.finalPrice
            cell.priceLabel.text = string

            print(bill.itemName)
        
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
