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
    func test_HasNameLabel() {
        let storyboard = UIStoryboard(name: "ItemListViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        controller.loadViewIfNeeded()
        
        
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        
        let cell = tableView?.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0))  as! ItemCell
        
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
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
