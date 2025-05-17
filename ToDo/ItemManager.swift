//
//  ItemManager.swift
//  ToDo
//
//  Created by Enjel Hutasoit on 18/05/25.
//

import Foundation

class ItemManager {
    var toDoCount: Int = 0
    
    func add(_ item: ToDoItem) {
        toDoCount += 1
    }
}
