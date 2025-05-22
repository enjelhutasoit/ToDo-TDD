//
//  InputViewControllerTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 22/05/25.
//

import Foundation
import XCTest
@testable import ToDo

final class InputViewControllerTests: XCTestCase {
    
    var sut: InputViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(
            name: "InputViewController",
            bundle: nil
        )
        sut = storyboard.instantiateViewController(
            withIdentifier: "InputViewController"
        ) as? InputViewController
        sut.loadViewIfNeeded()
    }
    
    func test_HasTitleTextField() {
        let titleTextFieldIsSubView = sut.titleTextField.isDescendant(of: sut.view)
        XCTAssertTrue(titleTextFieldIsSubView)
    }
}
