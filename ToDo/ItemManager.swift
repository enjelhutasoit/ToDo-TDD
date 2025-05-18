//
//  ItemManager.swift
//  ToDo
//
//  Created by Enjel Hutasoit on 18/05/25.
//

import Foundation

class ItemManager {
    
    private var toDoItems: [ToDoItem] = []
    private var doneItems: [ToDoItem] = []
    
    var toDoCount: Int { toDoItems.count }
    var doneCount: Int { doneItems.count }
    
    func add(_ item: ToDoItem) {
        toDoItems.append(item)
    }
    
    func item(at index: Int) -> ToDoItem {
        toDoItems[index]
    }
    
    func check(at index: Int) {        
        let checkedItem = toDoItems.remove(at: index)
        doneItems.append(checkedItem)
    }
    
    func doneItem(at index: Int) -> ToDoItem {
        doneItems[index]
    }
}
