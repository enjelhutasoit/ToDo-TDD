//
//  ItemManager.swift
//  ToDo
//
//  Created by Enjel Hutasoit on 18/05/25.
//

import Foundation

class ItemManager {
    private var toDoItem: [ToDoItem] = []
    
    var toDoCount: Int = 0
    
    func add(_ item: ToDoItem) {
        toDoCount += 1
        toDoItem.append(item)
    }
    
    func item(at index: Int) -> ToDoItem {
        toDoItem[index]
    }
}
