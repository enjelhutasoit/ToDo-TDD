//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Enjel Hutasoit on 19/05/25.
//

import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource {
    
    var itemManager: ItemManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemManager?.toDoCount ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
