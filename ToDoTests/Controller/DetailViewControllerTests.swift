//
//  DetailViewControllerTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 22/05/25.
//

import Foundation
import XCTest
@testable import ToDo

final class DetailViewControllerTests: XCTestCase {
    var sut: DetailViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(
            name: "DetailViewController",
            bundle: nil
        )
        sut = storyboard.instantiateViewController(
            withIdentifier: "DetailViewController"
        ) as! DetailViewController
        
        sut.loadViewIfNeeded()
    }
    
    func test_HasTitleLable() {
        let titleLableIsSubView = sut.titleLabel?.isDescendant(of: sut.view) ?? false
        
        XCTAssertTrue(titleLableIsSubView)
    }
}
