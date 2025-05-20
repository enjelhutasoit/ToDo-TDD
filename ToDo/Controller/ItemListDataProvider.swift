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

class ItemListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
