//
//  ItemListDataProviderTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 19/05/25.
//

import XCTest
@testable import ToDo

final class ItemListDataProviderTests:  XCTestCase {
    
    var sut: ItemListDataProvider!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        
        tableView = UITableView()
        tableView.dataSource = sut
    }
    
    func test_NumberOfSection_isTwo() {
        let numberOfSection = tableView.numberOfSections
        
        XCTAssertEqual(numberOfSection, 2)
    }
    
    func test_NumberOfRows_Section1_IsToDoCount() {
        sut.itemManager?.add(ToDoItem(title: "ToDo 1"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.itemManager?.add(ToDoItem(title: "ToDo 2"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_NumberOfRows_Section2_IsDoneCount() {
        sut.itemManager?.add(ToDoItem(title: "ToDo 1"))
        sut.itemManager?.add(ToDoItem(title: "ToDo 2"))
        sut.itemManager?.check(at: 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)

        sut.itemManager?.check(at: 1)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
}
