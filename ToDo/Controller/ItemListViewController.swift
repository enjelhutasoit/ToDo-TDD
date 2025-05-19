//
//  ItemListViewController.swift
//  ToDo
//
//  Created by Enjel Hutasoit on 19/05/25.
//

import UIKit

class ItemListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: UITableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataProvider
    }
}
