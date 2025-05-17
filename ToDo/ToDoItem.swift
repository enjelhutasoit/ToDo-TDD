//
//  ToDoItem.swift
//  ToDo
//
//  Created by Enjel Hutasoit on 18/05/25.
//

import Foundation

struct ToDoItem {
    let title: String
    let itemDescription: String?
    
    init(
        title: String,
        itemDescription: String? = nil
    ) {
        self.title = title
        self.itemDescription = itemDescription
    }
}
