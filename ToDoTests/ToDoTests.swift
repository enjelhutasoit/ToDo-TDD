//
//  ToDoTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 18/05/25.
//

import XCTest
@testable import ToDo

final class ToDoTests: XCTestCase {
    
    func test_Init_WhenGivenTitle_SetsTitle() {
        let item = ToDoItem(title: "Foo")
        
        XCTAssertEqual(
            item.title,
            "Foo",
            "should set  title"
        )
    }
    
    func test_Init_WhenGivenDescription_SetsDescription() {
        let item = ToDoItem(
            title: "",
            itemDescription: "Bar"
        )
        
        XCTAssertEqual(
            item.itemDescription,
            "Bar",
            "Should set description"
        )
    }
    
    func test_Init_WhenGivenTimestamp_SetsTimestamp() {
        let item = ToDoItem(
            title: "",
            timestamp: 0.0
        )
        
        XCTAssertEqual(
            item.timestamp,
            0.0,
            "Should set timestamp"
        )
    }
    
    func test_Init_WhenGivenLocation_SetsLocation() {
        let location = Location(name: "California")
        let item = ToDoItem(title: "", location: location)
        
        XCTAssertEqual(
            item.location?.name,
            location.name,
            "Should set location"
        )
    }
}
