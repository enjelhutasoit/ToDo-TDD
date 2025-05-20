//
//  ItemManagerTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 18/05/25.
//

import Foundation
import CoreLocation
import XCTest
@testable import ToDo

final class ItemManagerTests: XCTestCase {
    
    var sut: ItemManager!
    
    override func setUp() {
        super.setUp()
        sut = ItemManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ToDoCount_Initially_IsZero() {
        XCTAssertEqual(sut.toDoCount, 0)
    }
    
    func test_DoneCount_InitiallyIsZero() {
        XCTAssertEqual(sut.doneCount, 0)
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
    
    func test_RemoveAll_ResultsInCountsBeZero() {
        sut.add(ToDoItem(title: "ToDo 1"))
        sut.add(ToDoItem(title: "ToDo 2"))
        sut.check(at: 0)
        
        XCTAssertEqual(sut.toDoCount, 1)
        XCTAssertEqual(sut.doneCount, 1)
        
        sut.removeAll()
        
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 0)
    }
    
    func test_Add_WhenItemIsAlreadyAdded_DoesNotIncreaseCount() {
        sut.add(ToDoItem(title: "ToDo 1"))
        sut.add(ToDoItem(title: "ToDo 1"))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
}
