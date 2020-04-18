//
//  BillViewController.swift
//  KAT
//
//  Created by Tu Anh Nguyen on 4/17/20.
//  Copyright © 2020 KAT. All rights reserved.
//

import UIKit

class BillViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var billTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        billTableView.delegate = self
        billTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // change to amount of people on bill
        let count = 15
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BillCell") as! BillTableViewCell
        
        
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
