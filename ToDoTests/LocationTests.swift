//
//  LocationTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 18/05/25.
//

import XCTest
@testable import ToDo

final class LocationTests: XCTestCase {
    
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
