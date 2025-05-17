//
//  LocationTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 18/05/25.
//

import XCTest
@testable import ToDo
import CoreLocation


final class LocationTests: XCTestCase {
    
    func test_Init_GivenLocationName_SetsLocationName() {
        let locationName = "California"
        let location  = Location(name: locationName)
        
        XCTAssertEqual(
            location.name,
            locationName,
            "Set location should return \(locationName)"
        )
    }
    
    func test_Init_WhenGivenLocation_SetsLocation() {
        let location = Location(name: "California")
        let item = ToDoItem(title: "", location: location)
        
        XCTAssertEqual(
            item.location?.name,
            location.name,
            "Should set location"
        )
    }
    
    func test_Init_GiveCoordinate_SetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(
            latitude: 1,
            longitude: 2
        )
        
        let location = Location(name: "", coordinate: coordinate)
        XCTAssertEqual(
            location.coordinate?.latitude,
            coordinate.latitude
        )
        XCTAssertEqual(
            location.coordinate?.longitude,
            coordinate.longitude
        )
    }
}
