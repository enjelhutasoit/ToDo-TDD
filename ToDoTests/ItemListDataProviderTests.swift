//
//  ItemListDataProviderTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 19/05/25.
//

import XCTest
@testable import ToDo

final class ItemListDataProviderTests:  XCTestCase {
    
    func test_NumberOfSection_isTwo() {
        let sut = ItemListDataProvider()
        let tableView = UITableView()
        tableView.dataSource = sut
        
        let numberOfSection = tableView.numberOfSections
        
        XCTAssertEqual(numberOfSection, 2)
    }
    
    func test_NumberOfRows_Section1_IsToDoCount() {
        let sut = ItemListDataProvider()
        let tableView = UITableView()
        tableView.dataSource = sut
        sut.itemManager = ItemManager()
        
        sut.itemManager?.add(ToDoItem(title: "ToDo 1"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.itemManager?.add(ToDoItem(title: "ToDo 2"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
}
