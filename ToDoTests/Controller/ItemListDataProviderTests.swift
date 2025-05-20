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
    var controller: ItemListViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        
        let storyboard = UIStoryboard(
            name: "ItemListViewController",
            bundle: nil
        )
        controller = storyboard.instantiateViewController(
            withIdentifier: "ItemListViewController") as! ItemListViewController
          
        controller.loadViewIfNeeded()
          
        tableView = controller.tableView
        tableView.dataSource = sut
        tableView.delegate = sut
    }
    
    override func tearDown() {
        super.tearDown()
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

        sut.itemManager?.check(at: 0)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    func test_CellForRow_ReturnsItemCell() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        tableView.reloadData()
        
        let cell =
        tableView.cellForRow(
            at: IndexPath(
                row: 0,
                section: 0
            )
        )
        
        XCTAssertTrue(cell is ItemCell)
    }
}
