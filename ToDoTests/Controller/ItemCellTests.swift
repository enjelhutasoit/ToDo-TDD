//
//  ItemCellTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 22/05/25.
//

import UIKit
@testable import ToDo
import XCTest

final class ItemCellTests: XCTestCase {
    
    var tableView: UITableView!
    let dataSource = FakeDataSource()
    var cell: ItemCell!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "ItemListViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        controller.loadViewIfNeeded()
        
        
        _ = controller.view
        tableView = controller.tableView
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as? ItemCell
    }
    
    func test_HasNameLabel() {
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
    }
    
    func test_HasDateLabel() {
        XCTAssertTrue(cell.dateLabel.isDescendant(of: cell.contentView))
    }
    
    func test_HasLocationLabel() {
        XCTAssertTrue(cell.locationLabel.isDescendant(of: cell.contentView))
    }
    
    func test_ConfigCell_SetsTitle() {
        let title = "Todo1"
        cell.configCell(with: ToDoItem(title: title))
        XCTAssertEqual(cell.titleLabel.text, title)
    }
    
    func test_ConfigCell_SetsDate() {
        let dateString = "05/22/2025"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from: dateString)
        let timeStamp = date?.timeIntervalSince1970
        cell.configCell(with: ToDoItem(title: "Todo1", timestamp: timeStamp))
        
        XCTAssertEqual(cell.dateLabel.text, dateString)
    }
}

extension ItemCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource
    {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            UITableViewCell()
        }
    }
}
