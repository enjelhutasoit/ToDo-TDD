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
    let location: Location?
    
    init(
        title: String,
        itemDescription: String? = nil,
        timestamp: Double? = nil,
        location: Location? = nil
    ) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
}

struct Location {
    let name: String
}
