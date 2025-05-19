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
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        let storyboard = UIStoryboard(name: "ItemListViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        
        let sut = viewController as! ItemListViewController
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        let storyboard = UIStoryboard(name: "ItemListViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        let sut = viewController as! ItemListViewController
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView.dataSource is ItemListDataProvider)
    }
}
