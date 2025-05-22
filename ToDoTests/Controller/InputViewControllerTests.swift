//
//  InputViewControllerTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 22/05/25.
//

import CoreLocation
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
    
    func test_HasAddressTextField() {
        let addressTextFieldIsSubView = sut.addressTextField.isDescendant(of: sut.view)
        XCTAssertTrue(addressTextFieldIsSubView)
    }
    
    func test_HasDateTextField() {
        let dateTextFieldIsSubView = sut.dateTextField.isDescendant(of: sut.view)
        XCTAssertTrue(dateTextFieldIsSubView)
    }
    
    func test_HasDescriptionTextField() {
        let descriptionTextFieldIsSubView = sut.descriptionTextField.isDescendant(of: sut.view)
        XCTAssertTrue(descriptionTextFieldIsSubView)
    }
    
    func test_HasLocationTextField() {
        let locationTextFieldIsSubView = sut.locationTextField.isDescendant(of: sut.view)
        XCTAssertTrue(locationTextFieldIsSubView)
    }

    func test_HasCancelButton() {
        let cancelButtonIsSubView = sut.cancelButton.isDescendant(of: sut.view)
        XCTAssertTrue(cancelButtonIsSubView)
    }

    func test_HasSaveButton() {
        let saveButtonIsSubView = sut.saveButton.isDescendant(of: sut.view)
        XCTAssertTrue(saveButtonIsSubView)
    }
}

extension InputViewControllerTests {
    
    class MockGeocoder: CLGeocoder {
        
        var completionHandler: CLGeocodeCompletionHandler?
        
        override func geocodeAddressString(
            _ addressString: String,
            completionHandler: @escaping CLGeocodeCompletionHandler
        ) {
            self.completionHandler = completionHandler
        }
    }
}
