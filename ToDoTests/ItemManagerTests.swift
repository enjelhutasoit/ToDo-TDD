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
    
    var sut: ItemManager!
    
    override func setUp() {
        super.setUp()
        sut = ItemManager()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_ToDoCount_Initially_IsZero() {
        XCTAssertEqual(sut.toDoCount, 0)
    }
}
