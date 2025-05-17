//
//  ToDoTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 18/05/25.
//

import XCTest
@testable import ToDo

final class ToDoTests: XCTestCase {
    
    func test_Init_TakesTitle() {
        let item = ToDoItem(
            title: "Foo",
            itemDescription: "Bar"
        )
        
        XCTAssertNotNil(item, "item  should  not be nil")
    }
}
