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
    
    func test_CellForRow_DequeuesCellFromTableView() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(ItemCell.self,
                               forCellReuseIdentifier: "ItemCell")
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        mockTableView.reloadData()
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    func test_CellForRow_CallsConfigCell() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        
        let item = ToDoItem(title: "Todo1")
        sut.itemManager?.add(item)
        mockTableView.reloadData()
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockItemCell
        
        cell.configCell(with: item)
        
        XCTAssertEqual(cell.catchedItem, item)
    }
    
    func test_CellForRow_Section2_CallsConfigCellWithDoneItem() {
        let mockTableView = MockTableView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 320,
                height: 480
            ),
            style: .plain
        )
        
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        let item1 = ToDoItem(title: "Todo1")
        let item2 = ToDoItem(title: "Todo2")
        sut.itemManager?.add(item1)
        sut.itemManager?.add(item2)
        sut.itemManager?.check(at: 1)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(
            at: IndexPath(
                row: 0,
                section: 1
            )
        ) as! MockItemCell
        
        XCTAssertEqual(cell.catchedItem, item2)
    }
}

extension ItemListDataProviderTests {
    
    class MockTableView: UITableView {
        
        var cellGotDequeued = false
        
        override func dequeueReusableCell(
            withIdentifier identifier: String,
            for indexPath: IndexPath
        ) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(
                withIdentifier: identifier,
                for: indexPath
            )
        }
    }
    
    class MockItemCell: ItemCell {
        
        var catchedItem: ToDoItem?
        
        override func configCell(with item: ToDoItem) {
            catchedItem = item
        }
    }
}
