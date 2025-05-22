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
    
    func test_HasDescriptionLabel() {
        let descriptionLableIsSubView = sut.descriptionLabel?.isDescendant(of: sut.view) ?? false
        
        XCTAssertTrue(descriptionLableIsSubView)
    }
    
    func test_HasDateLabel() {
        let dateLabelIsSubView = sut.dateLabel?.isDescendant(of: sut.view) ?? false
        
        XCTAssertTrue(dateLabelIsSubView)
    }
    
    func test_HasLocationLabel() {
        let locationLabelIsSubView = sut.locationLabel?.isDescendant(of: sut.view) ?? false
        
        XCTAssertTrue(locationLabelIsSubView)
    }
    
    func test_HasMapView() {
        let mapViewIsSubView = sut.mapView?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(mapViewIsSubView)
    }
}
