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
    var doneCount: Int = 0
    
    func add(_ item: ToDoItem) {
        toDoCount += 1
        toDoItem.append(item)
    }
    
    func item(at index: Int) -> ToDoItem {
        toDoItem[index]
    }
    
    func check(at index: Int) {
        toDoCount -= 1
        doneCount += 1
        toDoItem.remove(at: index)
    }
}
