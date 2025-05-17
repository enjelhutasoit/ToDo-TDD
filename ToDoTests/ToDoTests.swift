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
}
