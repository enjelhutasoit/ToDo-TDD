//
//  ItemListViewControllerTest.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 19/05/25.
//

import XCTest
@testable import ToDo


final class ItemListViewControllerTest: XCTestCase {
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        let sut = ItemListViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView)
    }
}
