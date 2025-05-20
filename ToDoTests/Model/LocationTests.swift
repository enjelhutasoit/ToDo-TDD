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
            locationName
        )
    }
    
    func test_Init_GivenLocationCoordinate_SetsCoordinate() {
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
    
    func test_EqualLocations_AreEqual() {
        let location1 = Location(name: "Location1")
        let location2 = Location(name: "Location1")
        
        XCTAssertEqual(
            location1,
            location2,
            "Should return equal if \(location1) is same with \(location2)"
        )
    }
    
    func test_Items_WhenLocationDiffers_AreNotEqual() {
        let location1 = Location(name: "California")
        let location2 = Location(name: "New York")
        let todo1 = ToDoItem(title: "First", location: location1)
        let todo2 = ToDoItem(title: "Second", location: location2)
        
        XCTAssertNotEqual(todo1, todo2)
    }
    
    func test_Locations_WhenLatitudeDiffers_AreNotEqual() {
        let location1 = Location(
            name: "",
            coordinate: CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0)
        )
        
        let location2 = Location(
            name: "",
            coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 1.0)
        )
        
        XCTAssertNotEqual(location1, location2)
    }
    
    func test_Locations_WhenLongitudeDiffers_AreNotEqual() {
        assertLocationNotEqualWith(
            firstLocationName: "LocationName1",
            firstLocationLongLat: (1.0, 1.0),
            secondLocationName: "LocationName2",
            secondLocationLongLat: (1.0, 0.0)
        )
    }

    func assertLocationNotEqualWith(
        firstLocationName: String,
        firstLocationLongLat: ((Double, Double)?),
        secondLocationName: String,
        secondLocationLongLat: ((Double, Double)?),
        line: UInt = #line
    ) {
        var firstCoord: CLLocationCoordinate2D? = nil
        
        if let firstLocationLongLat {
            firstCoord = CLLocationCoordinate2D(
                latitude: firstLocationLongLat.0,
                longitude: firstLocationLongLat.1
            )
        }
        
        let firstLoc = Location(name: firstLocationName, coordinate: firstCoord)
        
        var secondCoord: CLLocationCoordinate2D? = nil
        
        if let secondLocationLongLat {
            secondCoord = CLLocationCoordinate2D(
                latitude: secondLocationLongLat.0,
                longitude: secondLocationLongLat.1
            )
        }
        
        let secondLoc = Location(name: secondLocationName, coordinate: secondCoord)

        
        XCTAssertNotEqual(firstLoc, secondLoc, line: line)
    }
}
