//
//  DetailViewControllerTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 22/05/25.
//

import CoreLocation
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
    
    func test_SettingItemInfo_SetsTextToLabels() {
        let titleText = "Todo1"
        let descriptionText = "Todo1 Desctiption"
        let locationName = "Location1"
        let coordinate = CLLocationCoordinate2DMake(51.2277, 6.7735)
        
        let location = Location(
            name: locationName,
            coordinate: coordinate
        )
        let item = ToDoItem(
            title: titleText,
            itemDescription: descriptionText,
            timestamp: 1456150025,
            location: location
        )
        let itemManager = ItemManager()
        itemManager.add(item)
        
        sut.itemInfo = (itemManager, 0)
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        
        XCTAssertEqual(
            sut.titleLabel.text,
            titleText
        )
        
        XCTAssertEqual(
            sut.dateLabel.text,
            "02/22/2016"
        )
        
        XCTAssertEqual(
            sut.locationLabel.text,
            locationName
        )
        
        XCTAssertEqual(
            sut.descriptionLabel.text,
            descriptionText
        )
        
        XCTAssertEqual(
            sut.mapView.centerCoordinate.latitude,
            coordinate.latitude,
            accuracy: 0.001
        )
        
        XCTAssertEqual(
            sut.mapView.centerCoordinate.longitude,
            coordinate.longitude,
            accuracy: 0.001
        )
    }
}
