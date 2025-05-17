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
    let timestamp: Double?
    
    init(
        title: String,
        itemDescription: String? = nil,
        timestamp: Double? = nil
    ) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
    }
}
