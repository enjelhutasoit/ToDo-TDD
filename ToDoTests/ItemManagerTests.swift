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
    
    func test_AddItem_IncreasesToDoCountToOne() {
        sut.add(ToDoItem(title: "ToDo 1"))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
    
    func test_ItemsAt_ReturnsAddedItem() {
        let item = ToDoItem(title: "Item 1")
        sut.add(item)
        let returnItem = sut.item(at:  0)
        
        XCTAssertEqual(returnItem.title, item.title)
    }
    
    func test_CheckItemAt_ChangesCounts() {
        sut.add(ToDoItem(title: ""))
        sut.check(at: 0)
        
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 1)
    }
    
    func test_CheckItemAt_RemovesItFromToDoItems() {
        let first = ToDoItem(title: "First")
        let second = ToDoItem(title: "Second")
        
        sut.add(first)
        sut.add(second)
        sut.check(at: 0)
        
        XCTAssertEqual(
            sut.item(at: 0).title,
            second.title,
            "Should return the second items as first item"
        )
    }
    
    func test_DoneItemAt_ReturnsCheckedItem() {
        let item = ToDoItem(title: "Item")
        sut.add(item)
        
        sut.check(at: 0)
        let returnedItem = sut.doneItem(at: 0)
        
        XCTAssertEqual(
            returnedItem.title,
            item.title,
            "Should return the checked/done item"
        )
    }
    
    func test_EqualItems_AreEqual() {
        let first = ToDoItem(title: "First")
        let second = ToDoItem(title: "Second")
        
        XCTAssertEqual(first, second)
    }
    
    func test_Items_WhenLocationDiffers_AreNotEqual() {
        let first = ToDoItem(title: "First", location: Location(name: "California"))
        let second = ToDoItem(title: "Second", location: Location(name: "New York"))
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_EqualLocations_AreEqual() {
        let first = Location(name: "Location1")
        let second = Location(name: "Location1")
        
        XCTAssertEqual(
            first,
            second,
            "Should return equal if \(first) is same with \(second)"
        )
    }
}
