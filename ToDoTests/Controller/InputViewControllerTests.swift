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

// MARK: - Networking
extension InputViewControllerTests {
    func test_Geocoder_FetchesCoordinates() {
        let address = "Infinite Loop 1, Cupertino"
        CLGeocoder()
            .geocodeAddressString(address) { (placemarks, error) -> Void in
                let coordinate =
                placemarks?.first?.location?.coordinate
                
                guard let latitude =
                        coordinate?.latitude else {
                    XCTFail()
                    return
                }
                guard let longitude = coordinate?.longitude else { XCTFail()
                    return
                }
                XCTAssertEqual(
                    latitude,
                    37.3316,
                    accuracy: 0.001
                )
                XCTAssertEqual(
                    longitude,
                    -122.0300,
                    accuracy: 0.001
                )
            }
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
