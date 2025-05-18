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
    
    var toDoCount: Int = 0
    var doneCount: Int = 0
    
    func add(_ item: ToDoItem) {
        toDoCount += 1
        toDoItems.append(item)
    }
    
    func item(at index: Int) -> ToDoItem {
        toDoItems[index]
    }
    
    func check(at index: Int) {
        toDoCount -= 1
        doneCount += 1
        
        let checkedItem = toDoItems.remove(at: index)
        doneItems.append(checkedItem)
    }
    
    func doneItem(at index: Int) -> ToDoItem {
        doneItems[index]
    }
}
