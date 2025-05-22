//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Enjel Hutasoit on 19/05/25.
//

import UIKit

enum Section: Int {
    case toDo
    case done
}

class ItemListDataProvider: NSObject, UITableViewDataSource {
    
    var itemManager: ItemManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let itemManager else { return 0 }
        guard let itemSection = Section(rawValue: section) else { fatalError() }
        
        let numberOfRows: Int
        
        switch itemSection {
        case .toDo:
            numberOfRows = itemManager.toDoCount
            
        case .done:
            numberOfRows = itemManager.doneCount
        }
        
        return numberOfRows
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
            
        guard let itemManager = itemManager else { fatalError() }
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        let item: ToDoItem
        
        switch section {
        case .toDo:
            item = itemManager.item(at: indexPath.row)
        case .done:
            item = itemManager.doneItem(at: indexPath.row)
        }
        
        cell.configCell(with: item)
        
        return cell
    }
}

extension ItemListDataProvider: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Check"
    }
}
