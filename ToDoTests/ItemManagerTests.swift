//
//  ItemManagerTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 18/05/25.
//

import Foundation
import XCTest
@testable import ToDo

final class ItemManagerTests: XCTestCase {
    
    func test_ToDoCount_Initially_IsZero() {
        let sut = ItemManager()
        
        XCTAssertEqual(sut.toDoCount, 0)
    }
}
