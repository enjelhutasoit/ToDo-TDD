//
//  ItemListViewControllerTest.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 19/05/25.
//

import XCTest
import UIKit
@testable import ToDo


final class ItemListViewControllerTest: XCTestCase {
    
    var sut: ItemListViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "ItemListViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = viewController as? ItemListViewController
        
        sut.loadViewIfNeeded()
    }
    
    func test_TableViewIsNotNilAfterViewDidLoad() {    XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource is ItemListDataProvider)
    }
}
